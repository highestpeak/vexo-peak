<#include "module/macro.ftl">
<@layout title="搜索 : ${keyword!} | ${blog_title!}" keywords="${keyword!}" description="搜索 : ${keyword!} | ${blog_title!}">

    <#-- 当前标签所含文章 -->
    <#if (posts.content)?? && posts.content?size gt 0>

        <#--文章列表-->
        <ul class="tag-preview">
            <#list posts.content as post>
                <li>
                    <a href="${post.fullPath!}"> ${post.title!}</a>
                </li>
            </#list>
        </ul>

        <#--分页-->
        <#include "module/pagination/pagination.ftl">
        <@pagination posts=posts/>
    <#else>
        <h1 class="nothing-find">NOTHING WAS FOUND</h1>
    </#if><#-- 当前标签所含文章 end -->

</@layout>

<#--  样式很少，所以不单独列出css文件  -->
<style>
.tag-preview {
    font-size: 1.1em;
    padding-left: 1em;
    transition: .4s cubic-bezier(0,0,.382,1.618);
}
.tag-preview li {
    cursor: pointer;
    margin: 10px 0;
    list-style: initial !important;
}
.tag-preview a {
    text-decoration: none !important;
    color: #42b983 !important;
    cursor: pointer !important;
}
.nothing-find{
    font-weight: 700;
    font-size: 200%;
    text-align: center;
    color: #F14668;
}
</style>