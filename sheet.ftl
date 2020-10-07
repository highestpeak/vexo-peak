<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | ${sheet.title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <#--  自定义页面进行解析  -->
    <#--  <h1>${sheet.title!}</h1>  -->
    <#--  ${sheet.formatContent!}  -->

    <#--  根据页面title可以方便的添加新的页面，自定义页面样式  -->
    <#if sheet.title == "ABOUT">
        <#--  todo: about页的名称需要为ABOUT  -->
        <#include "module/about.ftl">
        <@about/>
    </#if>
    <#--  <#if sheet.title == "REPO">
        <h1>${sheet.title!}</h1>
    </#if>
    <#if sheet.title == "TODO">
        <h1>${sheet.title!}</h1>
    </#if>  -->

    <#--  评论  -->
    <#include "module/comment.ftl">
    <@comment post=sheet type="sheet" />

</@layout>
