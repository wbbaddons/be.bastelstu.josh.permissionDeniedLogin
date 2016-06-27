{if !$__wcf->user->userID}
	<form method="post" action="{link controller='Login'}{/link}" id="loginForm">
		<div class="container containerPadding marginTop">
			<fieldset>
				<legend>{lang}wcf.user.login.data{/lang}</legend>

				<dl>
					<dt><label for="username">{lang}wcf.user.usernameOrEmail{/lang}</label></dt>
					<dd>
						<input type="text" id="username" name="username" value="" required="required" class="long" />
					</dd>
				</dl>

				{if !REGISTER_DISABLED}
					<dl>
						<dt>{lang}wcf.user.login.action{/lang}</dt>
						<dd><label><input type="radio" name="action" value="register" /> {lang}wcf.user.login.action.register{/lang}</label></dd>
						<dd><label><input type="radio" name="action" value="login" checked="checked" /> {lang}wcf.user.login.action.login{/lang}</label></dd>
					</dl>
				{/if}

				<dl>
					<dt><label for="password">{lang}wcf.user.password{/lang}</label></dt>
					<dd>
						<input type="password" id="password" name="password" value="" class="long" />
					</dd>
				</dl>

				<dl>
					<dd>
						<label for="useCookies"><input type="checkbox" id="useCookies" name="useCookies" value="1" /> {lang}wcf.user.useCookies{/lang}</label>
					</dd>
				</dl>

				{event name='fields'}

				<dl>
					<dd>
						<ul class="buttonList">
							<li><a class="button small" href="{link controller='LostPassword'}{/link}"><span>{lang}wcf.user.lostPassword{/lang}</span></a></li>
							{if !REGISTER_DISABLED && REGISTER_ACTIVATION_METHOD == 1}<li><a class="button small" href="{link controller='RegisterActivation'}{/link}"><span>{lang}wcf.user.registerActivation{/lang}</span></a></li>{/if}
							{event name='buttons'}
						</ul>
					</dd>
				</dl>
			</fieldset>

			{hascontent}
				<fieldset>
					<legend>{lang}wcf.user.login.3rdParty{/lang}</legend>

					<dl>
						<dt></dt>
						<dd>
							<ul class="buttonList smallButtons">
								{content}
								{if GITHUB_PUBLIC_KEY !== '' && GITHUB_PRIVATE_KEY !== ''}
									<li id="githubAuth" class="3rdPartyAuth">
										<a href="{link controller='GithubAuth'}{/link}" class="thirdPartyLoginButton githubLoginButton"><span class="icon icon16 icon-github"></span> <span>{lang}wcf.user.3rdparty.github.login{/lang}</span></a>
									</li>
								{/if}

								{if TWITTER_PUBLIC_KEY !== '' && TWITTER_PRIVATE_KEY !== ''}
									<li id="twitterAuth" class="3rdPartyAuth">
										<a href="{link controller='TwitterAuth'}{/link}" class="thirdPartyLoginButton twitterLoginButton"><span class="icon icon16 icon-twitter"></span> <span>{lang}wcf.user.3rdparty.twitter.login{/lang}</span></a>
									</li>
								{/if}

								{if FACEBOOK_PUBLIC_KEY !== '' && FACEBOOK_PRIVATE_KEY !== ''}
									<li id="facebookAuth" class="3rdPartyAuth">
										<a href="{link controller='FacebookAuth'}{/link}" class="thirdPartyLoginButton facebookLoginButton"><span class="icon icon16 icon-facebook"></span> <span>{lang}wcf.user.3rdparty.facebook.login{/lang}</span></a>
									</li>
								{/if}

								{if GOOGLE_PUBLIC_KEY !== '' && GOOGLE_PRIVATE_KEY !== ''}
									<li id="googleAuth" class="3rdPartyAuth">
										<a href="{link controller='GoogleAuth'}{/link}" class="thirdPartyLoginButton googleLoginButton"><span class="icon icon16 icon-google-plus"></span> <span>{lang}wcf.user.3rdparty.google.login{/lang}</span></a>
									</li>
								{/if}

								{event name='3rdpartyButtons'}
								{/content}
							</ul>
						</dd>
					</dl>
				</fieldset>
			{/hascontent}

			{event name='fieldsets'}
		</div>

		<div class="formSubmit">
			<input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
			<input type="hidden" name="url" value="{$__wcf->session->requestURI}" />
			{@SECURITY_TOKEN_INPUT_TAG}
		</div>
	</form>
{/if}