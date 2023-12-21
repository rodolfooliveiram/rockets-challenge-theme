<#assign AssetCategoryLocalService=serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryLocalService") />
<#if entries?has_content>
  <div class="search-results container px-2 py-1">
    <#list entries as entry>
      <#if entry?has_content>
        <#assign entryClassName=entry.getClassName() />
        <#assign entryClassPK=entry.getClassPK() />
        <#if entryClassName=="com.liferay.journal.model.JournalArticle">
          <#assign entryTitle=entry.getTitle() />
          <#assign entryViewURL=entry.getViewURL() />
          <#assign entryContent=entry.getContent() />
          <#assign entryCategories=AssetCategoryLocalService.getCategories(entryClassName, entryClassPK) />
          <div class="result">
            <a href="${entryViewURL}">
              <h3>
                ${entryTitle}
              </h3>
            </a>
            <p class="mb-4">
              ${entryContent}
            </p>
            <div class="categories d-flex flex-wrap">
              <#list entryCategories as entryCategory>
                <#assign categoryName=entryCategory.getName() />
                <#assign categoryIsLowerCase=stringUtil.lowerCase(categoryName) />
                <#assign categoryCSSClass=stringUtil.replace(categoryIsLowerCase, " " , "-" ) />
                <div class="category ${categoryCSSClass} px-2 py-1 mr-2">
                  ${categoryName}
                </div>
              </#list>
            </div>
          </div>
        </#if>
      </#if>
    </#list>
  </div>
</#if>