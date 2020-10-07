<#--  小矩形框-显示tag  -->
<#macro tagCard tags>
    <#include "colorRandom.ftl">
    <#list tags as tag>
        <#assign colorIndex = (colorIndex+1)%colorList?size >
        <a href="${tag.fullPath!}">
        <span class="tag-code" 
            style= ${ 
                "background-color:"+colorList[colorIndex]+";"+
                "color:#fff;"
            }>
            ${tag.name!}
        </span>
        </a>
    </#list>
</#macro>

<style>
.tag-code {
    font-family: 'Roboto Mono', Monaco, courier, monospace;
    font-size: 0.8em;
    display: inline-block;
    background-color: #f8f8f8;
    color: #e96900;
    padding: 3px 5px;
    margin: 0 2px 5px 0;
    border-radius: 2px;
    white-space: nowrap;
    font-weight: bold;
}
</style>