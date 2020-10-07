<#macro articleCard post>
<article class="article-card">
    <#--  标题  -->
    <h2 class="article-title">
        <a href="${post.fullPath!}" style="font-weight: 700;"> ${post.title!} </a>
    </h2>

    <#--  最后编辑时间  -->
    <p class="article-date">
        ${post.editTime!}
    </p>

    <#--  随机Tag颜色  -->
    <#include "tagCard.ftl">
    <@tagCard tags=post.tags/>

    <#--  文章摘要  -->
    <div class="article-content">
        ${post.summary!}
    </div>

    <#--  文章地址  -->
    <a href="${post.fullPath!}" class="readmore">
        Read more
    </a>
    
</article>
</#macro>

<style>
.article-card{
    margin:10px auto;
    display: block;
    padding-bottom: 10px;
    padding-top: 20px;
    border-top: 2px solid #dee2e6;
}
.article-card:first-child {
    margin-top: 40px;
    border-top: 0px;
}
.article-card *{
    text-align: initial;
}
.article-card * a{
  color:#2c3e50 !important;
}
.article-title{
    font-size: 1.6em;
    margin-bottom: 0;
}
.article-date{
    color: #7f8c8d;
    margin: 10px 0;
    font-size: 0.9em;
}
.article-content{
    margin: 10px 0;
    color: #34495e;

    overflow : hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3; 
    word-wrap:break-word;
    word-break:break-all;
}
.readmore{
    text-decoration: none !important;
    color: #42b983 !important;
    cursor: pointer;
    font-weight: 600 !important;
    display: inline-block;
    transition: all 0.3s !important;
    border-bottom: none !important;
}
.readmore:hover{
    transform: translateX(10px);
}
</style>
