<#include "module/macro.ftl">
<@layout title="${blog_title!}" keywords="${meta_keywords!}" description="${meta_description!}">
    <#--列表项-->
    <#if (posts.content)?? && posts.content?size gt 0>
        
        <#--文章列表-->
        <#include "module/articleCard.ftl">
        <div>
            <#list posts.content as post>
                <@articleCard post=post />
            </#list>
        </div>

        <#--分页-->
        <#include "module/pagination/pagination.ftl">
        <@pagination posts=posts/>

    <#else>
        <#-- 空列表 -->
        <h1>还没有写过文章</h1>
    </#if>
</@layout>