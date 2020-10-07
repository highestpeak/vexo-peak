<#macro about>
<div class="about">
    <#--  头像  -->
    <div class="block">
        <figure class="image is-96x96 level-item">
        <#--  是否圆形头像  -->
        <img 
            <#if settings.avatar_circle!true>
                class="is-rounded" 
            </#if>
            style="box-shadow: 0 0 5px #95a5a6;padding:3px;" 
            src="${user.avatar!}">
        </figure>
    </div>

    <#--  昵称  -->
    <h1 style="margin:20px;font-weight:700;font-size: 40px;">${user.nickname!}</h1>

    <#--  分割  -->
    <p></p>
    
    <#--  描述  -->
    <div style="font-weight:bold;margin:20px;">
        ${user.description!}
    </div>

    <#--  分割  -->
    <p></p>

    <#--  社交网络/联系方式  -->
    <section class="social-icons" style="transform: translateY(0px); opacity: 1;">
        <#--  github  -->
        <#if settings.github?? && settings.github != ''>
            <@social iconClass="icon-github" iconFont="fa-github" color="#333"
                socialHref="${settings.github!}" 
            />
        </#if>

        <#--  email  -->
        <#if settings.email?? && settings.email != ''>
            <@social iconClass="icon-envelope" iconFont="fa-envelope" color="#0767c8"
                socialHref="mailto:${settings.email!}" 
            />
        </#if>

        <#--  qq  -->
        <#if settings.qq?? && settings.qq != ''>
            <@social iconClass="icon-qq" iconFont="fa-qq" color="#d7385e"
                socialHref="tencent://AddContact/?fromId=50&fromSubId=1&subcmd=all&uin=${settings.qq!}" 
            />
        </#if>

        <#--  twitter  -->
        <#if settings.twitter??>
            <@social iconClass="icon-twitter" iconFont="fa-twitter" color="#5DA9DE"
                socialHref="https://twitter.com/${settings.twitter}" 
            />
        </#if>

        <#--  facebook  -->
        <#if settings.facebook??>
            <@social iconClass="icon-facebook" iconFont="fa-facebook" color="#4867AA"
                socialHref="https://www.facebook.com/${settings.facebook}" 
            />
        </#if>

        <#--  instagram  -->
        <#if settings.instagram??>
            <@social iconClass="icon-instagram" iconFont="fa-instagram" color="#c56183"
                socialHref="https://www.instagram.com/${settings.instagram}" 
            />
        </#if>

        <#--  dribbble  -->
        <#if settings.dribbble??>
            <@social iconClass="icon-dribbble" iconFont="fa-dribbble" color="#132743"
                socialHref="https://dribbble.com/${settings.dribbble}" 
            />
        </#if>

        <#--  weibo  -->
        <#if settings.weibo??>
            <@social iconClass="icon-weibo" iconFont="fa-weibo" color="#d7385e"
                socialHref="https://weibo.com/${settings.weibo}" 
            />
        </#if>

        <#--  rss  -->
        <#if settings.rss??>
            <@social iconClass="icon-rss" iconFont="fa-rss" color="#056674"
                socialHref="${atom_url!}" 
            />
        </#if>

    </section>
    
    <#--  分割  -->
    <p style="margin:50px;"></p>

    <#--  公告  -->
    <#--  当输入公告时才会显示  -->
    <#if settings.announcement?? && settings.announcement != ''>
        <div class="notification is-danger">
        <h1 style="font-size:20px;">公告</h1>
            ${settings.announcement!}
        </div>
    </#if>

    <p style="margin:50px;"></p>
</div>
</#macro>

<#--  社交网络 icon 通用样式  -->
<#macro social iconClass,iconFont,socialHref,color>
    <a class=${iconClass} href=${socialHref} target="_blank">
        <span class="fa-stack fa-lg">
            <i class="fa fa-circle fa-stack-2x" style="color: ${color}"></i>
            <i class="fa ${iconFont} fa-stack-1x fa-inverse" ></i>
        </span>
    </a>
</#macro>

<style>
.social-icons a:hover {
    transition: opacity 0.2s;
    opacity: 0.6;
}
.about *{
    margin:0 auto;
    text-align:center;
}

</style>