<#assign AssetEntryLocalService=serviceLocator.findService("com.liferay.asset.kernel.service.AssetEntryLocalService") />
<#assign AssetCategoryLocalService=serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryLocalService") />
<#assign JournalArticleLocalService=serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService") />
<#assign groupId=themeDisplay.getLayout().getGroupId() />
<#assign articleId=.vars["reserved-article-id"].data />
<#assign journalArticle=JournalArticleLocalService.getArticle(groupId, .vars["reserved-article-id"].data) />
<#assign resourcePrimKey=getterUtil.getLong(journalArticle.getResourcePrimKey()) />
<#assign assetEntry=AssetEntryLocalService.getEntry("com.liferay.journal.model.JournalArticle", resourcePrimKey) />
<#assign assetEntryCategories=assetEntry.getCategories() />

<div class="container">
  <div class="noticia-content w-75">
    <div class="d-flex flex-wrap mb-4">
      <#list assetEntryCategories as category>
        <#assign categoryName=category.getName() />
        <#assign categoryIsLowerCase=stringUtil.lowerCase(category.getName()) />
        <#assign categoryCSSClass=stringUtil.replace(categoryIsLowerCase, " " , "-" ) />
        <p class="category ${categoryCSSClass} px-2 py-1 mb-2 md-sm-0">
          ${categoryName}
        </p>
      </#list>
    </div>
    <h1 class="mb-4 font-weight-bold">
      ${noticiaTitle.getData()}
    </h1>
    <p class="mb-5">
      ${noticiaSummary.getData()}
    </p>
    <#if (noticiaContentImage.getData())?? && noticiaContentImage.getData() !="">
      <img class="w-100 mb-5" alt="${noticiaContentImage.getAttribute(" alt")}" data-fileentryid="${noticiaContentImage.getAttribute(" fileEntryId")}" src="${noticiaContentImage.getData()}" />
    </#if>
    <div class="mb-5">
      ${noticiaContent.getData()}
    </div>
  </div>
</div>