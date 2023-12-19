<#if has_navigation && is_setup_complete>
	<button aria-controls="navigationCollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right" data-target="#navigationCollapse" data-toggle="liferay-collapse" type="button">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse mt-4" id="navigationCollapse">
		<@liferay.navigation_menu default_preferences="${preferences}" />
		<#if !is_signed_in>
			<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" class="sign-in text-center d-block p-2 text-light font-weight-bold mt-3" rel="nofollow">
				${sign_in_text}
			</a>
		</#if>
	</div>
</#if>