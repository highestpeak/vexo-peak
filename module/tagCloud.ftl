<#macro tagCloud>
    <@tagTag method="list">
        <#if tags?? && tags?size gt 0>
            <#--  cloud  -->
            <#include "colorRandom.ftl">
            <div class="tag-cloud">
                <#list tags as tag>
                    <#--  每一项tag  -->
                    <#assign colorIndex = (colorIndex+1)%tags?size >
                    <a style= ${"background-color:"+colorList[colorIndex]+";"} 
                        href="${tag.fullPath!}">
                        ${tag.name}
                    </a>
                </#list>
            </div>
        </#if>
    </@tagTag>
</#macro>

<#--  css  -->
<style>
.tag-cloud *{
    text-align: initial;
}
.tag-cloud{
    margin: 30px 0;
    text-align: center;
}
.tag-cloud a {
    border: none;
    line-height: 28px;
    margin: 0 4px;
    margin-bottom: 8px;
    background: #63a35c;
    display: inline-block;
    border-radius: 4px;
    padding: 0 10px;
    color: #fff !important;
    transition: background 0.5s;
}
.tag-cloud a:hover{
    background: #0085a1 !important;
    border-bottom: none !important;
    padding-bottom: 0px !important;
}
</style>