<#include "module/macro.ftl">
<@layout title="${options.blog_title!} | 归档" keywords="${options.seo_keywords!}" description="${options.seo_description!}">    
    <#--  时间线body  -->
    <div class="time-body">
        <#--  按照年月归档  -->
        <@postTag method="archiveMonth">
            <#--  每一个年月项  -->
            <#list archives as archive>
                <section class="time-section">
                    <#--  年-月  -->
                    <h1 class="section-year">
                        ${archive.year?c +"-"+ archive.month?c}
                    </h1>

                    <#--  该月文章列表  -->
                    <#--  post对应的是 BasePostSimpleDTO  -->
                    <#list archive.posts?sort_by("createTime")?reverse as post>
                        <div class="section-list">
                            <div class="section-list-item">
                                <a href="${post.fullPath!}" class="archive-title">${post.title!}</a>
                                <p class="archive-date">${post.createTime!}</p>
                            </div>
                        </div>
                    </#list><#--  该月文章列表 end  -->
                </section>
            </#list><#--  每一个年月项 end  -->
        </@postTag><#--  按照年月归档 end  -->
    </div><#--  时间线body end  -->
</@layout>

<#--  样式足够多，但是考虑到是局部样式，所以放在这里  -->
<style>
.time-body{
    padding: 2em 1em;
    margin: 0 auto;
    height: 100%;
    max-width: 980px;
    position: relative;
    transform: translateY(-20px);
    transition: all 0.4s;
}
.time-body::before{
  position: absolute;
  top: 2em;
  bottom: 1em;
  left: 30px;
  height: auto;
  content: '';
  background-color: #42b983;
  width: 4px;
}
.time-body *{
  text-align: initial;
}

/* 覆盖 bulma 样式 */
.time-body *, ::after, ::before {
    box-sizing: initial !important;
}
.time-body h1, h2, h3, h4, h5, h6 {
    font-weight: revert !important;
}
/* 覆盖 bulma 样式 end */

.time-section {
    padding-left: 30px;
    position: relative;
}
.time-section .section-year {
    cursor: pointer;
    font-size: 1.8em;
    margin-left: 10px;
}
.time-section .section-year:before {
    position: absolute;
    left: 8px;
    top: 11px;
    content: '';
    background-color: #fff;
    width: 12px;
    height: 12px;
    border: 2px solid #42b983;
    border-radius: 50%;
}
.time-section .section-list .section-list-item {
    margin: 20px 0 20px 10px;
    position: relative;
}
.time-section .section-list .section-list-item:before {
    position: absolute;
    left: -29px;
    top: 7px;
    content: '';
    background-color: #42b983;
    width: 10px;
    height: 10px;
    border-radius: 50%;
}
.time-section .section-list .section-list-item .archive-title {
    color: #34495e;
    transition: all 0.3s ease;
    font-size: 1.1em;
    font-weight: initial !important;
}
.time-section .section-list .section-list-item .archive-title:hover {
    color: #42b983 !important;
    padding-left: 10px;
    padding-bottom: 0px !important;
    border-bottom: none !important;
}
.time-section .section-list .section-list-item .archive-date {
    color: #7f8c8d;
    font-size: 0.9em;
    margin: 5px 0;
}
</style>