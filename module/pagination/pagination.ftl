<#--分页-->
<#macro pagination posts>
    <#if posts.getTotalPages() gt 1>
        <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
        <nav class="pagination is-centered is-rounded is-small" role="navigation" aria-label="pagination" style="margin-top:20px;">
            <#--  上一页  -->
            <#if !pagination.hasPrev>
                <a class="pagination-previous" rel="prev" disabled>Previous</a>
            <#else>
                <a class="pagination-previous" rel="prev" href="${pagination.prevPageFullPath!}">Previous</a>
            </#if>

            <#--  下一页  -->
            <#if !pagination.hasNext>
                <a class="pagination-next" rel="next" disabled>Next page</a>
            <#else>
                <a class="pagination-next" rel="next" href="${pagination.nextPageFullPath!}">Next page</a>
            </#if>

            <#--  页码  -->
            <ul class="pagination-list">
            <#list pagination.rainbowPages as number>
                <#if number.isCurrent>
                    <li><a class="pagination-link is-current" href="javascript:void(0)"> ${number.page!}</a></li>
                <#else>
                    <li><a class="pagination-link"  href="${number.fullPath!}">${number.page!}</a></li>
                </#if>
            </#list>
            </ul><#--  页码 end  -->
        </nav>
        </@paginationTag>
    </#if>
</#macro>

<style>
.is-current{
    background-color:#42b983 !important;
    border-color: #42b983 !important;
}
</style>