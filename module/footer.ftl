<div style="margin:50px auto;text-align: center;" class="footer-html">
    <#--  icp备案  -->
    <#if settings.Icp?? && settings.IcpUrl??>
        <a href="${settings.IcpUrl!}" target="_blank" style="color:black;">${settings.Icp!}</a>
    </#if>

    <#--  其他页脚  -->
    <#if settings.footerHtml??>
        ${settings.footerHtml!}
    </#if>

    <#--  global footer  -->
    <@global.footer />
</div>

<style>
.footer-html,
.footer-html *{
    font-weight: 700;
}
</style>