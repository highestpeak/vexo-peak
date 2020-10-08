<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | ${post.title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <#--  内容输出  -->
    <div id="post-content" class="post-content">
        <div id="post-render-content" class="post-render-content">
            ${post.formatContent!}
        </div>
        <div class="copyright">
            <div class="copyright-wrapper">
                ${settings.postCopyrightNotice!}
            </div>
        </div>
    </div>

    <#--  comment 评论  -->
    <#include "module/comment.ftl">
    <@comment post=post type="post" />
</@layout>

<#--  浮动的目录  -->
<div id="md-toc-tree" class="md-toc-tree" style="opacity: 0;">
</div>
<div id="md-toc-tree-switch" class="md-toc-tree-switch">
    <span class="fa-stack">
        <i class="fa fa-circle fa-stack-2x" style="color: #d7385e"></i>
        <i class="fa fa-bookmark-o fa-stack-1x fa-inverse" ></i>
    </span>
</div>

<#--  markdown css 样式  -->
<link href="${theme_base!}/source/css/markdown.css" rel="stylesheet">
<#--  highlight.js  -->
<#if settings.code_theme_local?? && settings.code_theme_local != ''>
    <link href="${theme_base!}/source/css/${settings.code_theme_local!}" rel="stylesheet">
<#else>
    <link href="https://cdn.bootcdn.net/ajax/libs/highlight.js/10.0.0/styles/${settings.code_theme!}.min.css" rel="stylesheet">
</#if>
<#--  引入并初始化 highlight.js  -->
<script src="https://cdn.bootcdn.net/ajax/libs/highlight.js/10.0.0/highlight.min.js"></script>
<script> hljs.initHighlightingOnLoad(); </script>
<style>
.hljs {
    background: ${settings.code_background_color!'#002b36'} !important;
    color: ${settings.code_font_color!'#839496'} !important;
    font-family: ${settings.code_font_famliy!'monospace'} !important;
}
</style>

<#--  生成目录，并且设置点击事件  -->
<script>
    // get header list
    var resultList = [];

    var headerList = new Set(
        ["H1","H2","H3","H4","H5","H6"]
    );
    var renderedMd = document.getElementById("post-render-content");
    var renderedNodes=renderedMd.children;
    for(let i=0;i<renderedNodes.length;i++){
        var node = renderedMd.children[i];
        if(headerList.has(node.tagName)){
            resultList.push({
                "level":node.tagName[1],
                "id":node.id,
                "title":node.innerText
            });
        }
    }

    // generate toc tree
    var docTree = document.getElementById("md-toc-tree");
    resultList.forEach(header=>{
        const newA = document.createElement("a"); 
        newA.innerText = header.title;
        // newA.setAttribute("id", "copy");
        newA.style.marginLeft=20*header.level+"px";
        // newA.style.display="block";
        newA.onclick=function(){
            document.getElementById(header.id).scrollIntoView();
        };
        docTree.appendChild(newA);
    });
    document.getElementById('md-toc-tree-switch').addEventListener('click', () => {
        var toc = document.getElementById('md-toc-tree');
        const items = document.querySelector('.moon-menu-items');
        items.classList.toggle('active');
        const childItems = document.querySelectorAll('.moon-menu-item');
        if (toc.style.opacity==0) {
            toc.style.opacity = .9;
            toc.style.maxHeight="500px";
        } else {
            toc.style.opacity = 0;
            toc.style.maxHeight=0;
        }
    });
</script>

<#--  copyright css  -->
<style>
.copyright{
    margin-top:30px;
    border-left: 4px solid #d7385e !important;
    padding-left: 20px;
    padding-top: 10px;
    padding-bottom: 10px;
    background-color: #e9ecef82;
}
.copyright-wrapper{

}
</style>