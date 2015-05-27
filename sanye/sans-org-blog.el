(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory "/var/virtual/home-bak/org/blog"
         :base-extension "org"
         :publishing-directory "/var/virtual/home-bak/org/kumakichi.github.io/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :section-numbers nil
         :auto-preamble t
         :auto-sitemap t                ; Generate sitemap.org automagically...
         :sitemap-filename "index.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         :author "sanye"
         :email ""
         :html-head "<link rel='stylesheet' type='text/css' href='css/main.css'/>
		 <link rel='shortcut icon' href='img/favicon.ico'/>"
         :html-preamble "<div id='header'>
		<div class='inner'>
			<h1 id='site-title'><a href='/'>San's notebook</a></h1>
			<div>
				<a href='###' id='site-nav-btn'>MenuBar</a>
				<ul id='site-nav' class='vertical-nav mobi-hid'>
					<li class='current-page'><a href='/'>Home</a></li>
					<li><a href='/about.html'>About</a></li>
				</ul>

				<form id='site-search' method='get' action='https://www.google.com/search'>
				<input type='hidden' name='q' value='site:kumakichi.github.io'>
				<input type='text' name='q' placeholder='Search...'>
				<button class='btn-search' type='submit'>Search</button>
				</form>

				<div style='clear:both;'> </div>
			</div>
		</div>
	</div>"
         :html-postamble "<div id='disqus_thread'></div>
			<script type='text/javascript'>
			    /* * * CONFIGURATION VARIABLES * * */
			    var disqus_shortname = 'callmesanye';
			    
			    /* * * DON'T EDIT BELOW THIS LINE * * */
			    (function() {
			        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
			        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
			        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
			    })();
			</script>
			<noscript>Please enable JavaScript to view the <a href='https://disqus.com/?ref_noscript' rel='nofollow'>comments powered by Disqus.</a></noscript>
			<p class='author'>Author: %a %e</p><p>Exported At %T. Created by %c </p>
			<a href='#' class='back-to-top' id='fixed-back-to-top' style='display: inline;'></a>"
    	)
        ("blog-static"
         :base-directory "/var/virtual/home-bak/org/blog/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "/var/virtual/home-bak/org/kumakichi.github.io/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-static"))
        ;;
        ))
(provide 'sans-org-blog)
