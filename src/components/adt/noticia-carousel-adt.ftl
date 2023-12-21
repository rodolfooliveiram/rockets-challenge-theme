<#assign AssetCategoryLocalService=serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryLocalService")>
  <#if entries?has_content>
    <div class="container">
      <div class="asset-publisher-carousel p-3">
        <#list entries as curEntry>
          <#assign assetRenderer=curEntry.getAssetRenderer() />
          <#assign journalArticle=assetRenderer.getAssetObject() />
          <#assign DDMFormFieldValuesReferencesMap=journalArticle.getDDMFormValues().getDDMFormFieldValuesReferencesMap(true) />
          <#assign noticiaTitle=DDMFormFieldValuesReferencesMap["noticiaTitle"]
            [0].getValue().getString(locale) />
          <#assign noticiaSummary=DDMFormFieldValuesReferencesMap["noticiaSummary"]
            [0].getValue().getString(locale) />
          <#assign noticiaThumbJSONString=DDMFormFieldValuesReferencesMap["noticiaThumb"]
            [0].getValue().getString(locale) />
          <#assign noticiaCategories=curEntry.getCategories() />
          <#assign noticiaThumbJSON=noticiaThumbJSONString?eval />
          <#assign noticiaURL=assetRenderer.getURLViewInContext(renderRequest, renderResponse, '' ) />
          <div class="asset">
            <div class="row h-100 m-0">
              <a href="${noticiaURL}" class="asset-img-wrapper col-md-4 p-0">
                <div class="position-relative h-100">
                  <img class="asset-img position-absolute w-100 h-100" src="${noticiaThumbJSON.url}" alt="">
                </div>
              </a>
              <div class="col-md-8 d-sm-flex flex-column justify-content-between px-1 px-md-4 mt-3 mt-md-0">
                <div>
                  <h2 class="font-weight-bold mb-3">
                    <a class="title-link" href="${noticiaURL}">
                      ${noticiaTitle}
                    </a>
                  </h2>
                  <div class="asset-content">
                    <p>
                      ${noticiaSummary}
                    </p>
                  </div>
                </div>
                <div class="categories d-flex flex-wrap">
                  <#list noticiaCategories as category>
                    <#assign categoryName=category.getName() />
                    <#assign categoryIsLowerCase=stringUtil.lowerCase(category.getName()) />
                    <#assign categoryCSSClass=stringUtil.replace(categoryIsLowerCase, " " , "-" ) />
                    <div class="category ${categoryCSSClass} px-2 py-1 mr-2">
                      ${categoryName}
                    </div>
                  </#list>
                </div>
              </div>
            </div>
          </div>
        </#list>
      </div>
    </div>
  </#if>