<!DOCTYPE html>
<html>
<head>
  $if(doc.hasQuickNavV1)$
  <link href="$doc.baseUrl$/quick-jump.css" rel="stylesheet" type="text/css" title="QuickJump" />
  $endif$
  $hackageCssTheme()$
  <title>
    $package.name$$if(package.optional.hasSynopsis)$: $package.optional.synopsis$$endif$
  </title>
  <meta name="twitter:card" content="summary" />
  <meta name="twitter:site" content="@hackage" />
  <meta property="og:url" content="$baseurl$/package/$package.name$" />
  <meta property="og:site_name" content="Hackage" />
  <meta property="og:type" content="website">
  <meta property="og:title" content="$package.name$" />
  <meta property="og:description" content="$package.optional.synopsis$" />
  $if(isDeprecated)$
    <meta name="robots" contents="noindex">
  $endif$
  <link rel="canonical" href="$sbaseurl$/package/$package.name$" />
  <script src="/static/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml-full.js" type="text/javascript"></script>
  <base href="$baseurl$/package/$package.name$-$package.version$/" />
</head>

<body>
  $hackagePageHeader()$

  <div id="content">
    <h1><a href="$baseurl$/package/$package.name$">$package.name$</a>$if(package.optional.hasSynopsis)$: <small>$package.optional.synopsis$</small>$endif$</h1>
    <div style="font-size: small">
      [ $tags$ ]
      [ <a href="/package/$package.name$/tags/edit">Propose Tags </a> ]
    </div>

    $if(isDeprecated)$
    <div id="deprecated">
      <span style="color:#D00B3C">Deprecated.</span>
      $deprecatedMsg$
    </div>
    $else$
      $if(isDeprecatedVersion)$
      <div id="deprecated-version">
        <span style="color:#D00B3C">This version is deprecated.</span>
      </div>
      $endif$
    $endif$

    <div id="flex-container">

      <div id="left-pane">

        <div id="description">
          $if(package.optional.hasDescription)$
          $package.optional.description$
          $endif$
          $if(package.optional.hasReadme)$
          <hr>
          [<a href="#readme">Skip to Readme</a>]
          $endif$
        </div>

        <div id="badges" style="margin-top: 20px;">
            $if(install.0)$
              <a href="$install.3$">
                <img src="https://img.shields.io/static/v1?label=Build&message=$install.2$&color=$install.1$" />
              </a>
            $endif$
            $if(test.0)$
              <img src="https://img.shields.io/static/v1?label=Tests&message=$test.2$&color=$test.1$" />
            $endif$
            $if(covg.0)$
              <img src="https://img.shields.io/static/v1?label=Coverage&message=$covg.2$%&color=$covg.1$" />
            $endif$
            $if(!hasExecOnly)$
              <img src="https://img.shields.io/static/v1?label=Documentation&message=$if(hasDocs)$Available$else$Unavailable$endif$&color=$if(hasDocs)$success$else$critical$endif$" />
            $endif$
        </div>

        <div id="modules">
          $moduleList$
        </div>

        $if(hackage.hasFlags)$
        <div id="flags">
          $hackage.flagsSection$
        </div>
        $endif$

        <div id="downloads">
          $downloadSection$
        </div>

        <div id="maintainer-corner">
          <h4>Maintainer's Corner</h4>
          <p><a href="$package.maintainerURL$">Package maintainers</a></p>
          <ul>
            <li>
              $maintainers$
            </li>
          </ul>
          <p>For package maintainers and hackage trustees</p>
          <ul>
            <li>
              <a href="$baseurl$/package/$package.name$/maintain">
                edit package information
              </a>
            </li>
          </ul>
          <p>Candidates</p>
          <ul>
            <li>
              $candidates$
            </li>
          </ul>
        </div>

      </div><!-- /left-pane -->


      <div id="properties">
        <table class="properties">
          <tbody>

            <tr>
              <th>Versions <span style="font-weight:normal;font-size: small;">[<a href="/package/$package.name$.rss">RSS</a>]</span></th>
              <td>$versions$</td>
            </tr>

            $if(package.optional.hasChangelog)$
            <tr>
              <th>Change&nbsp;log</th>
              <td class="word-wrap">$package.optional.changelog$</td>
            </tr>
            $endif$

            <tr>
              <th>Dependencies</th>
              <td>$package.buildDepends$</td>
            </tr>

            <tr>
              <th>License</th>
              <td class="word-wrap">$package.license$</td>
            </tr>

            $if(package.optional.hasCopyright)$
            <tr>
              <th>Copyright</th>
              <td class="word-wrap">$package.optional.copyright$</td>
            </tr>
            $endif$

            <tr>
              <th>Author</th>
              <td class="word-wrap">$package.author$</td>
            </tr>
            <tr>
              <th>Maintainer</th>
              <td class="word-wrap">$package.maintainer$</td>
            </tr>

            $if(hackage.hasUpdateTime)$
            <tr>
              <th>Revised</th>
              <td>$hackage.updateTime$</td>
            </tr>
            $endif$

            <!-- Obsolete/deprecated 'Stability' field hidden
                 c.f. http://stackoverflow.com/questions/3841218/conventions-for-stability-field-of-cabal-packages
            <tr>
              <th>Stability</th>
              <td>$stability$</td>
            </tr>
            -->

            $if(package.optional.hasCategories)$
            <tr>
              <th>Category</th>
              <td>$package.optional.category$</td>
            </tr>
            $endif$

            $if(package.optional.hasHomePage)$
            <tr>
              <th>Home page</th>
              <td class="word-wrap">
                <a href=$package.optional.homepage$>
                  $package.optional.homepage$
                </a>
              </td>
            </tr>
            $endif$

            $if(package.optional.hasBugTracker)$
            <tr>
              <th>Bug&nbsp;tracker</th>
              <td class="word-wrap">
                <a href="$package.optional.bugTracker$">
                  $package.optional.bugTracker$
                </a>
              </td>
            </tr>
            $endif$

            $if(package.optional.hasSourceRepository)$
            <tr>
              <th>Source&nbsp;repo</th>
              <td class="word-wrap">$package.optional.sourceRepository$</td>
            </tr>
            $endif$

            <tr>
              <th>Uploaded</th>
              <td>$hackage.uploadTime$</td>
            </tr>


            $if(hackage.hasDistributions)$
            <tr>
              <th>Distributions</th>
              <td>$hackage.distributions$</td>
            </tr>
            $endif$

            $if(hasrdeps)$
            <tr>
              <th>Reverse Dependencies</th>
              <td>$rdeps$</td>
            </tr>
            <script>
              \$('.revdepdetails').click(function(e) {
                e.preventDefault();
                var html = '$rdepsummary$'
                modal.open({ content: html});
              });
            </script>
            $endif$

            $if(hasexecs)$
            <tr>
              <th>Executables</th>
              <td>$executables$</td>
            </tr>
            $endif$

            <tr>
              <th>Downloads</th>
              <td>$totalDownloads$ total ($recentDownloads$ in the last 30 days)</td>
            </tr>

            <tr>
              <th> Rating</th>
              <td>$if(hasVotes)$$score$ (votes: $votes$)$else$(no votes yet)$endif$
              <span style="font-size: small">[estimated by <a href="https://en.wikipedia.org/wiki/Bayesian_average">Bayesian average</a>]</span></td>
            </tr>

            <tr>
              <th>Your&nbsp;Rating</th>
              <td>
                <ul class="star-rating">
                  <li class="star uncool" id="1">&lambda;</li>
                  <li class="star uncool" id="2">&lambda;</li>
                  <li class="star uncool" id="3">&lambda;</li>
                </ul>
              $if(userRating)$
                <input type="hidden" id="userRating" value="$userRating$">
                [<a href="" class="clear-rating">clear rating</a>]
              $endif$
              </td>
            </tr>
            <tr>
              <th>Status</th>
              <td>$buildStatus$</td>
            </tr>
          </tbody>
        </table>
      </div> <!-- /properties -->
    </div><!-- /flex-container -->

    $if(package.optional.hasReadme)$
    <hr />
    <div id="readme-container">
      <h2 id="readme">Readme for $package.name$-$package.version$</h2>
      [<a href="#description">back to package description</a>]
      $package.optional.readme$
    </div>
    $endif$
  </div> <!-- /content -->

  $packagePageAssets()$
  <div style="clear:both"></div>
  $footer()$

  $if(doc.hasQuickNavV1)$
  <script src="$doc.baseUrl$/quick-jump.min.js" type="text/javascript"></script>
  <script type="text/javascript"> quickNav.init("$doc.baseUrl$", function(toggle) {var t = document.getElementById('quickjump-trigger');if (t) {t.onclick = function(e) { e.preventDefault(); toggle(); };}}); </script>
  $endif$

  $analyticsPixels:{analyticsPixelUrl|
  <img referrerpolicy="no-referrer-when-downgrade" src="$analyticsPixelUrl$" />
  }; separator=""$

</body>
</html>
