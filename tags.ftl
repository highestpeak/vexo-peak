<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 标签列表" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <#-- 只显示标签云 -->
    <#include "module/tagCloud.ftl">
    <@tagCloud />
    <#--  标签所含文章在tag页面显示  -->
</@layout>