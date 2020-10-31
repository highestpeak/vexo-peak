<#macro layout title,keywords,description>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <#-- 博客设置 -->
        <meta name="author" content="${user.nickname!}" />
        <meta name="keywords" content="${keywords!}"/>
        <meta name="description" content="${description!}" />
        <title>${title}</title>
        <@global.head />

        <#-- 渲染控制 -->
        <meta charset="UTF-8">
        <meta name="format-detection" content="telephone=no" />
        <meta name="renderer" content="webkit">
        <#--  为了让Bulma正确的工作，需要网页是响应式的  -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <#--  可以让前端缓存这几个css和js，因为js的banner的svg背景实在太大了  -->
        <#--  样式引入  -->
        <link href="//cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet"/>
        <#--  bulma会干扰markdown的渲染  -->
        <#if is_post??==false>
            <#--  bulma css framework  -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
        </#if>
        <#--  服务器 source 文件夹的样式  -->
        <link href="${theme_base!}/source/css/style.css" rel="stylesheet">
        <link href="${theme_base!}/source/css/header.css" rel="stylesheet">
        <link href="${theme_base!}/source/css/banner.css" rel="stylesheet">
        <#--  <link href="${theme_base!}/source/css/style.min.css" type="text/css" rel="stylesheet" />  -->
        <#--  Atom 格式的订阅地址  -->
        <link rel="alternate" type="application/rss+xml" title="atom 1.0" href="${atom_url!}">
        
        <#--  全局样式  -->
        <style>
            /*  自定义样式  */
            ${settings.custom!}

            /*  去除body的边距，平滑滚动  */
            body {
                margin: 0px;
                padding: 0px;
                scroll-behavior: smooth;
            }
            /*  Firefox & Chrome 隐藏滚动条  */
            html::-webkit-scrollbar{
                /*display: none;*/
                width: thin;
                scrollbar-width:thin;
            }
            html {
                /*隐藏滚动条，当IE下溢出，仍然可以滚动*/
                /*-ms-overflow-style:none;
                scrollbar-width:none;
                scroll-behavior: smooth;*/
                scrollbar-width:thin;
            }
            /*Chrome下隐藏滚动条，溢出可以透明滚动*/
            ::-webkit-scrollbar {
                width: 20px;
                height: 8px;
                overflow: auto;
                float: left;
                margin: 0 10px;
                width: 10px;
            }
            ::-webkit-scrollbar-thumb {
                background: #666;
                border-radius: 20px;
            }
            ::-webkit-scrollbar-track {
                background: #ddd;
                border-radius: 20px;
            }

            /* 主要内容区域 */
            #main-body-nav {
                padding: 15px;
                transition-duration: 0.5s;
                margin-top: 30px;
            }
            .main-body{
                padding: 2em 1em;
                margin: 0 auto;
                height: 100%;
                max-width: 980px;
                position: relative;
                transform: translateY(-20px);
                transition: all 0.4s;
            }

            /* 覆盖 bulma 样式 */
            /*
            *, ::after, ::before {
                box-sizing: initial !important;
            }
            */
        </style>
        
        <#--  comment.ftl 也会引入，在全局先引入是为了提醒会引入了vue  -->
        <script src="//cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
        <#--  引入服务器js(全局均会使用)  -->
        <script type="text/javascript" src="${theme_base!}/source/js/svgBackground.js"></script>
        <script type="text/javascript" src="${theme_base!}/source/js/scrollTop.js"></script>
    </head>
    <body>
        <#--  引入menu  -->
        <#include "head.ftl"> 
        <section id="main-body-nav">
            <div class="main-body">
                <#--  可以嵌套内容  -->
                <#nested > 
                <#--  页脚  -->
                <#include "footer.ftl"> 
            </div>
            <#--  回到顶部  -->
            <#include "toTop.ftl"> 
        </section>
    </body>
</html>
</#macro>