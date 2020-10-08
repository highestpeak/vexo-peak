<#--  banner svg / 花纹背景svg -->
<#if is_index??==false>
    <#--  根据不同页面设置 banner 的标题和内容描述  -->
    <#assign bannerTitle = user.nickname>
    <#assign bannerPargrah = "">
    
    <#--  页面判断  -->
    <#if is_post??>
        <#assign bannerTitle = post.title>
        <#assign bannerPargrah = "创建时间:&nbsp;&nbsp;"+post.createTime>
        <#assign bannerPargrah = bannerPargrah+"<br/>最后编辑时间:&nbsp;&nbsp;"+post.editTime>
    </#if>
    <#if is_categories??>
        <#assign bannerTitle = "分类">
    </#if>
    <#if is_tags??>
        <#assign bannerTitle = "标签">
    </#if>
    <#if is_tag??>
        <#assign bannerTitle = tag.name>
    </#if>
    <#if is_link??>
        <#assign bannerTitle = "友链">
    </#if>
    <#if is_archives??>
        <#assign bannerTitle = "归档">
    </#if>
    <#if is_search??>
        <#assign bannerTitle = "搜索关键字 : "+keyword>
    </#if>
    <#--  end if  -->

    <div id="article-banner" class="article-banner" >
        <#--  标题  -->
        <h2 id="article-banner-header" style="transform: translateY(0px); opacity: 1;">
            ${bannerTitle}
        </h2>

        <#--  描述段落  -->
        <p id="article-banner-p" class="post-date" style="transform: translateY(0px); opacity: 1;">
            ${bannerPargrah}
        </p>

        <#--  文章内容页，会显示标签等内容  -->
        <#if is_post??>
            <p id="article-banner-p" class="post-date" style="transform: translateY(0px); opacity: 1;">
                <#--  随机Tag颜色  -->
                <#include "tagCard.ftl">
                <@tagCard tags=post.tags/>
            </p>
        </#if>
    </div>
</#if><#--  banner svg end -->


<#--  渲染 logo、昵称、菜单  -->
<#if is_index??==false>
<#--  标题栏渲染  -->
<div id="vexo-page-header" class="header" style="height: 60px;">
<#else>
<#--  标题栏渲染  -->
<#--  首页标题栏直接固定  -->
<div id="vexo-page-header" class="header fixed-header" style="height: 60px;">
</#if>
    <#--  header container  -->
    <div class="header-container">

        <#--  左侧 logo and 名称  -->
        <a id="header-logo-and-name-link" class="header-logo-and-name-link" href="/">
            <#-- 是否圆形 logo -->
            <img class="logo" src="${blog_logo!}" 
                <#if settings.avatar_circle!true>
                    style="border-radius:100px"
                </#if>
            >
            </img>

            <#--  昵称  -->
            <span style="font-weight: 600;
                <#if is_index??>
                    color:#42b983;
                </#if>
            ">${user.nickname!}</span>
        </a>

        <#--  右侧菜单  -->
        <@menuTag method="list">
            <ul class="header-menu">
                <#--
                    ?sort_by('priority')：根据菜单的排序编号排序
                -->
                <#list menus?sort_by('priority') as menu>
                    <li class="header-menu-item">
                        <a href="${menu.url}" 
                            target="${menu.target!}" 
                            class="header-menu-item-link" 
                            style="color:#000;"
                            >
                            ${menu.name} 
                        </a>
                    </li>
                </#list>
            </ul>
        </@menuTag><#--  右侧菜单 end  -->
    </div><#--  header container end  -->
</div><#--   标题栏绚烂  -->


<#--  首页不显示  -->
<#--  为了让元素渲染完成，所以把script放到这里  -->
<#if is_index??==false>
    <#--  svg在第一次访问站点的时候就发送过去了  -->
    <#--  svg在一个js里，游览器会缓存下来，所以可能有已经更改了svg列表，但是游览器没有更改的问题  -->
    <script>
        // 随机颜色
        var randomColorIndex = Math.floor(Math.random() * svgColorList.length );
        var randomColor = svgColorList[randomColorIndex];

        // 随机svg
        var randomSvgImageIndex = Math.floor(Math.random() * svgImageList.length );
        var randomSvgImage = svgImageList[randomSvgImageIndex];

        //  设置banner  
        var banner = document.getElementById("article-banner");
        banner.style.backgroundColor = "#"+randomColor[0];
        banner.style.backgroundImage = "url("+randomSvgImage[0]+randomColor[1]+randomSvgImage[1]+")";
        banner.style.color = randomColor[2];
        var h2=document.getElementById("article-banner-header");
        h2.style.color = randomColor[2];
        var p=document.getElementById("article-banner-p");
        p.style.color = randomColor[2];

        // 设置标题栏字体颜色
        var headerLogo=document.getElementById("header-logo-and-name-link");
        headerLogo.style.color = randomColor[2];
        renderMenuItem(randomColor[2]);

        // 设置标题栏右侧菜单栏字体颜色
        function renderMenuItem(color){
            var alist = document.getElementsByClassName("header-menu-item-link");
            if(alist){
                for(var idx = 0; idx < alist.length; idx ++){
                    var mya = alist[idx];
                    mya.style.color = color;
                }
            }
        }
        
        // 设置标题栏颜色  
        // 设置窗口滚动监听
        window.onscroll = function() {
            // 为了保证兼容性，这里取两个值，哪个有值取哪一个
            // scrollTop就是触发滚轮事件时滚轮的高度
            var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
            var header=document.getElementById("vexo-page-header");
            // 设置标题栏字体颜色
            headerLogo=document.getElementById("header-logo-and-name-link");
            if(scrollTop>40){
                header.classList.add("fixed-header");
                headerLogo.style.color = "#42b983";
                renderMenuItem("#000");
            }else{
                header.classList.remove("fixed-header");
                headerLogo.style.color = randomColor[2];
                renderMenuItem(randomColor[2]);
            }
        }// end onscroll function
    </script>
</#if>