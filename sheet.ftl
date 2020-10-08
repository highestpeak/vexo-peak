<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | ${sheet.title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <#--  自定义页面进行解析  -->
    <#--  <h1>${sheet.title!}</h1>  -->
    <#--  ${sheet.formatContent!}  -->

    <#--  评论  -->
    <#include "module/comment.ftl">
    <@comment post=sheet type="sheet" />

</@layout>
