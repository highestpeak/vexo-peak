<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 友情链接" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <#--  友链wrapper  -->
    <div>
        <@linkTag method="list">
            <#if links?? && links?size gt 0>
                <#--  友链列表  -->
                <div class="friends" style="">
                    <#list links as link>
                        <a href="${link.url}" class="a-friend" 
                            style="background-color:white;color:black;max-width: 300px;" 
                            target="_blank" rel="external">
                            <#--  logo  -->
                            <figure class="blog-avatar image is-128x128 level-item">
                                <img class="is-rounded" src="${link.logo}">
                            </figure>
                            <#--  详细信息  -->
                            <div class="text-container">
                                <div class="name">${link.name}</div>
                                <#if link.description!=''>
                                    <p class="description">${link.description}</p>
                                </#if>                               
                            </div><#--  详细信息end  -->
                        </a>
                    </#list>
                </div><#--  友链列表 end  -->
            </#if>
        </@linkTag>
    </div><#--  友链wrapper end  -->
</@layout>

<style>
.friends {
    display: flex;
    flex-wrap: wrap;
}
.friends .a-friend {
    display: flex;
    margin: 30px 15px 0 0;
    text-decoration: none;
    font-weight: 300;
    box-shadow: 0 1px 6px rgba(0, 0, 0, 0.2);
    padding: 10px;
    transition: box-shadow 0.2s, transform 0.2s;
    align-items: center;
}
.friends .a-friend:hover {
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
}
.friends .a-friend:active {
    transform: scale(0.95);
}
.friends .a-friend .blog-avatar {
    background-color: white;
    border-radius: 50%;
    width: 50px;
    height: 50px;
}
.friends .a-friend .text-container {
    margin-left: 10px;
}
.friends .a-friend .text-container .name {
    font-size: 14px;
    font-weight: 550;
}
.friends .a-friend .text-container .description {
    font-size: 12px;
    margin-top: 5px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    word-wrap: break-word;
    word-break: break-all;
}
</style>
