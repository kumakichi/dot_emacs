(require 'org-publish)
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
         :sitemap-title "San's notebook"         ; ... with title 'Sitemap'.
         :html-link-home "index.html"
         :author "kumakichi"
         :email "$(dc -e 40964654306938118710083764053554616036618P)"
         :style    "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/worg.css\"/>"
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
			<p class='author'>Author: %a (%e)</p><p>Exported At %T. Created by %c </p>"
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
