<#if entries?has_content>
  <#list entries as entry>
    <#assign categories=entry.getCategories() />
    <#if categories?has_content>
      <div class="categories categories-filter d-flex flex-wrap">
        <#list categories as category>
          <div>
            <#assign categoryName=category.getName() />
            <#assign categoryIsLowerCase=stringUtil.lowerCase(category.getName()) />
            <#assign categoryCSSClass=stringUtil.replace(categoryIsLowerCase, " " , "-" ) />
            <#assign categoryViewURL=renderResponse.createRenderURL() />
            ${categoryViewURL.setParameter("resetCur", "true")}
            ${categoryViewURL.setParameter("categoryId", category.getCategoryId()?string)}
            <a href="${categoryViewURL}" class="category ${categoryCSSClass} d-block px-3 py-2 mr-2 mb-2">
              ${categoryName}
            </a>
          </div>
        </#list>
      </div>
    </#if>
  </#list>
</#if>