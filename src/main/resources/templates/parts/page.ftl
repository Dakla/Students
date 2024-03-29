<#macro pager url page>
<#if page.getTotalPages() gt 7>
<#assign
totalPages = page.getTotalPages()
pageNum = page.getNumber() + 1

head = (pageNum > 4)?then([1, -1], [1, 2, 3])
tail = (pageNum < totalPages - 3)?then([-1, totalPages], [totalPages - 2, totalPages - 1, totalPages])
bodyBefore = (pageNum > 4 && pageNum < totalPages - 1)?then([pageNum - 2, pageNum - 1], [])
bodyAfter = (pageNum > 2 && pageNum < totalPages - 3)?then([pageNum + 1, pageNum + 2], [])

body = head + bodyBefore + (pageNum > 3 && pageNum < totalPages - 2)?then([pageNum], []) + bodyAfter + tail
>
<#else>
<#assign
body = 1..page.getTotalPages()
>
</#if>
<div class="mt-3">
    <ul class="pagination">
        <li class="page-item disabled">
            <a class="page-link" href="#" tabindex="-1">Страницы</a>
        </li>
        <#list body as p>
        <#if p == page.getNumber() + 1>
        <li class="page-item active">
            <a class="page-link" href="#" tabindex="-1">${p}</a>
        </li>
        <#elseif p == -1>
        <li class="page-item disabled">
            <a class="page-link" href="#" tabindex="-1">...</a>
        </li>
        <#else>
        <li class="page-item">
            <a class="page-link" href="${url}?page=${p}&size=10" tabindex="-1">${p}</a>
        </li>
    </#if>
</#list>
</ul>
</div>
</#macro>