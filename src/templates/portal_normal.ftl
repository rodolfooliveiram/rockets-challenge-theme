<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key=" lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>
		${html_title}
	</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<@liferay_util["include"]
		page=top_head_include />
</head>

<body class="${css_class}">
	<@liferay_ui["quick-access"]
		contentId="#main-content" />
	<@liferay_util["include"]
		page=body_top_include />
	<div class="d-flex flex-column min-vh-100">
		<@liferay.control_menu />
		<div class="d-flex flex-column flex-fill position-relative" id="wrapper">
			<#if show_header>
				<header id="banner" role="banner" class="p-3 p-md-4 bg-light">
					<div id="heading" class="navbar navbar-light navbar-top py-3 d-none d-md-block">
						<div class="container p-0">
							<div class="align-items-center autofit-row">
								<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments=" ${site_name}" key="go-to-x" />">
								<img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
								<#if show_site_name>
									<span class="site-name" title="<@liferay.language_format arguments=" ${site_name}" key="go-to-x" />">
									${site_name}
									</span>
								</#if>
								</a>
								<#assign preferences=freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />
								<div class="autofit-col autofit-col-expand">
									<div class="px-5">
										<@liferay.navigation_menu default_preferences="${preferences}" />
									</div>
								</div>
								<div class="autofit-col">
									<#if show_header_search>
										<div class="justify-content-md-end mr-4 navbar-form" role="search">
											<@liferay.search_bar default_preferences="${preferences}" />
										</div>
									</#if>
								</div>
								<div class="autofit-col">
									<#if !is_signed_in>
										<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" class="sign-in px-3 py-2 text-light font-weight-bold" rel="nofollow">
											${sign_in_text}
										</a>
										<#else>
											<@liferay.user_personal_bar />
									</#if>
								</div>
							</div>
						</div>
					</div>
					<div class="navbar navbar-expand-md navbar-light d-md-none px-0">
						<div class="container-fluid p-0">
							<a class="${logo_css_class} align-items-center d-inline-flex d-md-none logo-xs" href="${site_default_url}" rel="nofollow">
								<img alt="${logo_description}" src="${site_logo}" />
								<#if show_site_name>
									<h2 <#if show_control_menu>aria-hidden="true"
								</#if> class="font-weight-bold h2 mb-0 text-dark">
								${site_name}
								</h2>
			</#if>
			</a>
			<#include "${full_templates_path}/navigation.ftl" />
		</div>
	</div>
	</header>
	</#if>
	<section id="content">
		<h2 class="hide-accessible sr-only" role="heading" aria-level="1">
			${htmlUtil.escape(the_title)}
		</h2>
		<#if selectable>
			<@liferay_util["include"]
				page=content_include />
			<#else>
				${portletDisplay.recycle()}
				${portletDisplay.setTitle(the_title)}
				<@liferay_theme["wrap-portlet"]
					page="portlet.ftl">
					<@liferay_util["include"]
						page=content_include />
					</@>
		</#if>
	</section>
	<#if show_footer>
		<footer id="footer" role="contentinfo">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center text-light text-md-left">
						<@liferay.language_format
							arguments='<a class="text-decoration-underline text-white" href="https://github.com/rodolfooliveiram" target="_blank" rel="external">Rodolfo Oliveira</a>'
							key="powered-by-x" />
					</div>
				</div>
			</div>
		</footer>
	</#if>
	</div>
	</div>
	<@themeJs filename='jquery-1.11.0.js' />
	<@themeJs filename='jquery-migrate-1.2.1.js' />
	<@themeJs filename='slick.js' />
	<@liferay_util["include"]
		page=body_bottom_include />
	<@liferay_util["include"]
		page=bottom_include />
</body>

</html>
<#macro themeJs filename>
	<#assign relative_path=javascript_folder + '/' + filename />
	<#assign resource_url=portalUtil.getStaticResourceURL(request, relative_path) />
	<#assign url=htmlUtil.escape(resource_url) />
	<script src="${url}"></script>
</#macro>