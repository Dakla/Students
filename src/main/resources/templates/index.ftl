<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<#import "parts/page.ftl" as p>
<@c.page>
<div class="container">
    <div class="row">
        <div class="col-sm">
            <h2 class="mt-3"><a href="/">Список абитуриентов</a></h2>
        </div>
        <#if student??>
            <div class="col-sm mt-4 text-right">
                <a href="/edit" class="reg">Изменить параметры профиля</a>
            </div>
            <form action="/logout" method="post" class="mt-3">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-primary">Выход</button>
            </form>
        <#else/>
            <div class="col-sm mt-4 text-right">
                <a href="/registration" class="reg">Регистрация</a>
            </div>
            <div class="col-sm mt-4 text-right">
                <a href="/login" class="reg">Вход</a>
            </div>
        </#if>
    </div>
    <div class="row">
        <div class="col-sm mt-3">
                <form class="form-inline my-2 my-lg-0 justify-content-center" action="/" method="GET">
                    <input class="form-control mr-sm-2- col-sm-7" type="search" placeholder="Поиск" aria-label="Search" name="filter" value="${filter}">
                    <button class="btn btn-outline-primary my-2 my-sm-0 ml-2" type="submit">Поиск</button>
                </form>
        </div>
    </div>
    <div class="row">
        <table class="table mt-5">
            <thead>
                <tr>
                    <th scope="col"><a href="/?<#if filter != ''>filter=${filter}&</#if>sort=name,<#if sort == 'name'><#if type == 'desc'>asc<#elseif type == 'asc'>desc<#else>asc</#if><#else>asc</#if>">Имя</a></th>
                    <th scope="col"><a href="/?<#if filter != ''>filter=${filter}&</#if>sort=surname,<#if sort == 'surname'><#if type == 'desc'>asc<#elseif type == 'asc'>desc<#else>asc</#if><#else>asc</#if>">Фамилия</a></th>
                    <th scope="col"><a href="/?<#if filter != ''>filter=${filter}&</#if>sort=gNumber,<#if sort == 'gNumber'><#if type == 'desc'>asc<#elseif type == 'asc'>desc<#else>asc</#if><#else>asc</#if>">Номер группы</a></th>
                    <th scope="col"><a href="/?<#if filter != ''>filter=${filter}&</#if>sort=points,<#if sort == 'points'><#if type == 'desc'>asc<#elseif type == 'asc'>desc<#else>asc</#if><#else>asc</#if>">Баллов</a></th>
                </tr>
            </thead>
            <tbody>
            <#list students.content as student>
                <tr>
                    <th>${student.name}</th>
                    <th>${student.surname}</th>
                    <th>${student.gNumber}</th>
                    <th>${student.points}</th>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
<@p.pager url page />
</div>
</@c.page>