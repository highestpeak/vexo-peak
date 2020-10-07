<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 分类列表" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <@categoryTag method="list">
        <#if categories?? && categories?size gt 0>
            <div class="category-list" >
                <#--  分类列表/系列目录  -->
                <#list categories as category>
                    <#--  分类名称  -->
                    <a class="category-name" onclick="tagClick(${category.id})">
                        ${category.name}
                    </a>

                    <#--  所有该分类的文章，点击后显示  -->
                    <@postTag method="listByCategoryId" categoryId=category.id>
                        <#--  一个分类的预览  -->
                        <ul class="category-preview" id="${category.id}"  style="opacity: 0;height:0;">
                        
                            <#--  选择性显示分类描述  -->
                            <div class="notification " style="margin: 25px 0;
                                <#if category.description?length == 0>
                                    padding:0;
                                </#if>
                                ">
                                ${category.description}
                            </div>

                            <#--  文章列表  -->
                            <#list posts as post>
                                <li>
                                    <a href="${post.fullPath!}"> ${post.title!}</a>
                                </li>
                            </#list><#--  文章列表 end -->
                        </ul><#--  一个分类的预览  end-->
                    </@postTag>
                </#list>
                <#--  分类列表/系列目录 end -->
            </div>
        </#if>
    </@categoryTag>
</@layout>

<script>
// 点击分类名称，隐藏和显示列表详情
function tagClick(id) {
    var targetList = document.getElementById(id);
    var display = targetList.style.opacity;
    if (display === "0") {
        targetList.style.opacity=1;
        targetList.style.height="auto";
    }else{
        targetList.style.opacity=0;
        targetList.style.height="0";
    }
}
</script>

<#--  样式很少，所以不单独列出css文件  -->
<style>
.category-list{
    margin-left: 1em;
    margin-right: 1em;
}
.category-name{
    font-size: 1.4em;
    position: relative;
    width: max-content;
    margin: 10px 0;
    color:#000;
}
.category-name::before{
    content: "#";
    color: #42b983;
    position: absolute;
    left: -0.7em;
    top: -2px;
    font-size: 1.2em;
    font-weight: 700;
}
.category-name:hover{
    cursor: pointer;
}
.category-preview {
    font-size: 1.1em;
    padding-left: 1em;
    transition: .4s cubic-bezier(0,0,.382,1.618);
}
.category-preview li {
    cursor: pointer;
    margin: 10px 0;
    list-style: initial !important;
}
.category-preview a {
    text-decoration: none !important;
    color: #42b983 !important;
    cursor: pointer !important;
}
</style>

