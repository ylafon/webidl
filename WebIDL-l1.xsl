<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
                xmlns:h='http://www.w3.org/1999/xhtml'
                xmlns:x='http://mcc.id.au/ns/local'
                xmlns='http://www.w3.org/1999/xhtml'
                exclude-result-prefixes='h x'
                version='1.0' id='xslt'>

  <xsl:output method='xml' encoding='UTF-8'
              omit-xml-declaration='yes'
              doctype-public='-//W3C//DTD XHTML 1.0 Transitional//EN'
              doctype-system='http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'
              media-type='application/xhtml+xml; charset=UTF-8'/>

  <xsl:variable name='options' select='/*/h:head/x:options'/>
  <xsl:variable name='id' select='/*/h:head/h:meta[@name="revision"]/@content'/>
  <xsl:variable name='rev' select='substring-before(substring-after(substring-after($id, " "), " "), " ")'/>

  <xsl:param name='now'>12340506<!--
    <xsl:value-of select='translate(substring-before(substring-after(substring-after(substring-after($id, " "), " "), " "), " "), "/", "")'/>-->
  </xsl:param>

  <xsl:template match='/'>
    <xsl:text>&#xa;</xsl:text>
    <xsl:if test='$options/x:maturity="ED"'>
      <xsl:comment>
  l1.html
  Web IDL

  Note: This file is generated from index.xml.  Run "make" to regenerate it.
  </xsl:comment>
      <xsl:text>&#xa;</xsl:text>
    </xsl:if>

      <xsl:apply-templates select='/*'/>
  </xsl:template>

  <xsl:template match='h:*'>
    <xsl:element name="{name()}" namespace="{namespace-uri()}">
      <xsl:copy-of select='@*[namespace-uri()="" or namespace-uri="http://www.w3.org/XML/1998/namespace"]'/>
      <xsl:apply-templates select='node()'/>
    </xsl:element>
  </xsl:template>

    <!-- generate a respec header, including bib entries -->
  <xsl:template match='h:head'>
    <head>
      <xsl:copy-of select='@*[namespace-uri()="" or namespace-uri="http://www.w3.org/XML/1998/namespace"]'/>
      <xsl:apply-templates select='node()'/>
        <meta charset="utf-8" />
        <meta content="width=device-width,initial-scale=1" name="viewport" />
        <title>WebIDL Level 1</title>
        <script class="remove" src="https://www.w3.org/Tools/respec/respec-w3c-common" type="application/ecmascript">
        </script>
        <script class="remove" type="application/ecmascript" src="l1.js" />
        <script class="remove" type="application/ecmascript">
            var respecConfig = {
            localBiblio: {
                "DOM3CORE": {
                    "aliasOf": "DOM-Level-3-Core",
                    "id": "DOM3CORE"
                },
                "XMLNS" : {
                    "aliasOf": "xml-names",
                    "id": "XMLNS"
                },
                "IEEE-754" : {
                    "href" : "http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=4610935",
                    "date": "03 September 2008",
                    "id": "IEEE-754",
                    "publisher": "ANSI/IEEE",
                    "title": "IEEE Standard for Floating-Point Arithmetic"
                },
                "WEBIDL" : {
                     "href" : "https://heycam.github.io/webidl/",
                     "id"   : "WEBIDL",
                     "title": "WebIDL"
                },
                "OMGIDL" : {
                    "href"  : "http://www.omg.org/cgi-bin/doc?formal/08-01-04.pdf",
                    "publisher": "Object Management Group",
                    "date"  : "January 2008",
                    "title" : "CORBA 3.1 – OMG IDL Syntax and Semantics chapter"
                },
                "PERLRE" : {
                    "href"  : "http://search.cpan.org/dist/perl/pod/perlre.pod",
                    "title" : "Perl Regular Expressions (Perl 5.8.8)",
                    "publisher" : "The Perl Foundation",
                    "date" : "January 2006"
                },
                "TYPEDARRAYS" : {
                    "href" : "https://www.khronos.org/registry/typedarray/specs/1.0/",
                    "authors" : [
                         "V. Vukicevic",
                         "K. Russell"
                     ],
                    "title" : "Typed Array Specification",
                    "date"  : "8 February 2011",
                    "publisher": "The Khronos Group"
                }
            },
            specStatus: '<xsl:value-of select="$options/x:maturity" />' ,
            shortName: "WebIDL-1",
            //publishDate:  "2014-03-27",
            previousPublishDate: "2012-04-19",
            previousMaturity: "CR",
            previousURI: "http://www.w3.org/TR/2012/CR-WebIDL-20120419/",
            edDraftURI: "https://heycam.github.io/webidl/",
            // lcEnd: "3000-01-01",
            // crEnd: "3000-01-01",
            editors: [
            <xsl:for-each select='$options/x:editors/x:person'>
                {
                name: '<xsl:value-of select="x:name" />',
                company: '<xsl:value-of select="x:affiliation" />',
                <xsl:if test="@homepage">
                    url: '<xsl:value-of select="@homepage" />',
                </xsl:if>
                <xsl:if test="@email">
                    mailto: '<xsl:value-of select="@email" />',
                </xsl:if>
                <xsl:if test="x:affiliation/@homepage">
                    companyURL: '<xsl:value-of select="@homepage" />',
                </xsl:if>
                },
            </xsl:for-each>
            ],
            preProcess: reg_custom(),
         //   preProcess: do_something(),
            wg: "Web Applications Working Group",
            wgURI: "http://www.w3.org/2008/webapps/",
    <!--        wgPublicList: '<xsl:value-of select="$options/x:participate/x:mailing-list/@email" />',-->
            wgPublicList: "public-script-coord",
            wgPatentURI: "http://www.w3.org/2004/01/pp-impl/42538/status",
            otherLinks: [{
            key: 'Participate',
            data: [{
            value: 'We are on Github.',
            href: 'https://github.com/heycam/webidl'
            }, {
            value: 'File a bug.',
            href: 'https://github.com/heycam/webidl/issues'
            }, {
            value: 'Commit history.',
            href: 'https://github.com/heycam/webidl/commits/gh-pages'
            }, {
            value: 'Mailing list.',
            href: 'http://lists.w3.org/Archives/Public/public-script-coord/'
            }]
            }]
            };
        </script>
    </head>
  </xsl:template>

    <xsl:template match='h:title'>
        <title>WebIDL Level 1</title>
    </xsl:template>

    <!-- end of head -->

  <xsl:template match='h:span[@class="idltype"]'>
    <xsl:variable name='id' select='concat("idl-", translate(., " ", "-"))'/>
    <xsl:variable name='def' select='//*[@id=$id]'/>
    <xsl:choose>
      <xsl:when test='not(ancestor::h:a) and not(@id) and $def'>
        <a class='idltype' href='#{$id}'><xsl:apply-templates select='node()'/></a>
      </xsl:when>
      <xsl:otherwise>
        <span>
          <xsl:copy-of select='@*[namespace-uri()="" or namespace-uri="http://www.w3.org/XML/1998/namespace"]'/>
          <xsl:apply-templates select='node()'/>
        </span>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match='h:a[not(@href)]'>
    <xsl:variable name='name' select='string(.)'/>
    <xsl:variable name='a-class' select='@class'/>
    <xsl:variable name='term' select='$options/x:links/x:term[@name=$name]'/>
    <xsl:if test='not($term)'>
      <xsl:message terminate='yes'>unknown term '<xsl:value-of select='$name'/>'</xsl:message>
    </xsl:if>
    <xsl:variable name='ref' select='$term/@ref'/>
    <xsl:variable name='section' select='$term/@section'/>
    <xsl:variable name='term-class' select='$term/@class'/>
    <xsl:variable name='final-class'>
      <xsl:value-of select='$a-class'/>
      <xsl:if test='$a-class and $term-class'>
        <xsl:text> </xsl:text>
      </xsl:if>
      <xsl:value-of select='$term-class'/>
    </xsl:variable>
    <a class="{$final-class}" href='{$term/@href}'>
      <xsl:apply-templates/>
    </a>
    <xsl:if test='not(contains($a-class, "nocite")) and $ref'>
      <xsl:if test='$section'>
        <xsl:text> (</xsl:text>
      </xsl:if>
      <a href='#ref-{$ref}'>[<xsl:value-of select='$ref'/>]</a>
      <xsl:if test='$section'>
        <xsl:text>, section </xsl:text>
        <xsl:value-of select='$section'/>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template match='processing-instruction("productions")'>
    <xsl:variable name='id' select='substring-before(., " ")'/>
    <xsl:variable name='names' select='concat(" ", substring-after(., " "), " ")'/>
    <table class='grammar'>
      <xsl:call-template name='proddef'>
        <xsl:with-param name='prods' select='//*[@id=$id]/x:prod[contains($names, concat(" ", @nt, " "))]'/>
        <xsl:with-param name='pi' select='.'/>
      </xsl:call-template>
    </table>
  </xsl:template>

    <xsl:template match='a/processing-instruction("top")'>
        <section id='sotd'>
            <p>
                Custom paragraph
            </p>
        </section>
    </xsl:template>

  <xsl:template match='h:a/processing-instruction("sref")'>
    <xsl:variable name='id' select='string(./processing-instruction("sref"))'/>
    <a href="#{$id}"></a>
  </xsl:template>

  <xsl:template match='processing-instruction("sdir")'>
    <xsl:variable name='id' select='string(.)'/>
<!--    <xsl:choose>
      <xsl:when test='preceding::h:div[@id=$id][@class="section"]'>above</xsl:when>
      <xsl:when test='following::h:div[@id=$id][@class="section"]'>below</xsl:when>
      <xsl:otherwise>@@</xsl:otherwise>
    </xsl:choose> -->
  </xsl:template>

  <xsl:template match='processing-instruction("revision-note")'>
    <xsl:if test='$options/x:maturity="ED"'>
      <div class='ednote'>
        <div class='ednoteHeader'>Editorial note</div>
        <p>This version of the document is built from source revision <xsl:text disable-output-escaping='yes'>&amp;#36;</xsl:text><xsl:value-of select='substring($id, 2)'/>.</p>
        <xsl:variable name='n' select='count(//h:div[@class="ednote"])'/>
        <xsl:if test='$n'>
          <p>
            There are <xsl:value-of select='$n'/> further editorial notes in the document.
            <xsl:if test='string(.)'>
              In addition, there is a list of <a href='{.}'>open bugs</a> on the document, some of which may be covered by editorial notes.
            </xsl:if>
          </p>
        </xsl:if>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match='processing-instruction("stepref")'>
    <xsl:variable name='step' select='string(.)'/>
    <xsl:variable name='li' select='ancestor::*[@class="algorithm"]/*[@x:step=$step]'/>
    <xsl:choose>
      <xsl:when test='$li'>
        <xsl:value-of select='count($li/preceding-sibling::*) + 1'/>
      </xsl:when>
      <xsl:otherwise>@@</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

<!--  <xsl:template match='processing-instruction()|comment()'/> -->

    <!-- generate section for respec creating ids when missing -->
    <xsl:template match='h:div[@class="section"]'>
        <xsl:choose>
            <xsl:when test="@id">
                <section id='{translate(@id, " ", "-")}'>
                        <xsl:apply-templates/>
                </section>
            </xsl:when>
            <xsl:when test='h:h2/@id|h:h3/@id|h:h4/@id|h:h5/@id|h:h6/@id'>
                <section id='{translate(h:h2/@id|h:h3/@id|h:h4/@id|h:h5/@id|h:h6/@id, " ", "-")}'>
                        <xsl:apply-templates />
                 </section>
            </xsl:when>
            <xsl:otherwise>
                <section id='{translate(h:h2|h:h3|h:h4|h:h5|h:h6, "ABCDEFGHIJKLMNOPQRSTUVWXYZ ", "abcdefghijklmnopqrstuvwxyz-")}'>
                        <xsl:apply-templates />
                </section>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template match="h:div[@id='appendices']">
        <xsl:for-each select='./h:div[@class="section"]'>
            <xsl:choose>
                <xsl:when test="@id='references'">
                    <section id='references' class='appendix'>
                    </section>
                </xsl:when>
                <xsl:when test="@id='idl-grammar'">
                    <section id='idl-grammar' class='appendix'>
                        <xsl:apply-templates select="./*" />
                    </section>
                </xsl:when>
                <xsl:otherwise>
                    <section id="{@id}" class="appendix">
                        <xsl:apply-templates select="./*" />
                </section>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>


    <xsl:template match="h:div[@id='sections']">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="h:h2[text()='Abstract']|h:h2[@id='sotd']|h:div[@id='conformance']/h:h2|h:div[@id='conformance']/h:p[1]|h:div[@id='conformance']/h:p[2]">
    </xsl:template>

    <xsl:template match="/h:html/h:body/h:div[2]/h:p[1]">
        <p>
            This is the "Level 1" Version of WebIDL, it contains parts of the main Editor's copy [[WEBIDL]] that
            are considered stable, implemented and tested.
            Implementors should defer to the Editor's copy [[WEBIDL]] only, as it may contains updated algorithm and definitions;
            Consumers of this specifications, like specifications authors, can point to this specification if all the definitions and properties they need are defined in this specification.
            Note that this specification will be updated to match changes in the editor's copy until it reaches Recommendation, new development will be followed in the next Level of WebIDL.

        </p>
    </xsl:template>

    <!-- Level 1 specific stuff, removal, additions, etc... -->
    <xsl:template match="h:script[@src='dfn.js']|h:script[@src='section-links.js']">
    </xsl:template>

    <!-- maplike: DONE -->
    <xsl:template match="h:div[@id='es-maplike']|h:div[@id='idl-maplike']">
    </xsl:template>
    <xsl:template match="/h:html/h:body/h:div[@id='appendices']/h:div[@id='idl-grammar']/x:grammar/x:prod[@nt='ReadWriteMaplike']">
    </xsl:template>
    <xsl:template match="/h:html/h:body/h:div[@id='appendices']/h:div[@id='idl-grammar']/x:grammar/x:prod[@nt='ReadWriteSetlike']">
    </xsl:template>
    <xsl:template match="/h:html/h:body/h:div[@id='appendices']/h:div[@id='idl-grammar']/x:grammar/x:prod[@nt='MaplikeRest']">
    </xsl:template>
    <xsl:template match="/h:html/h:body/h:div[@id='appendices']/h:div[@id='idl-grammar']/x:grammar/x:prod[@nt='SetlikeRest']">
    </xsl:template>
    <!-- setlike: DONE (with maplike) -->
    <xsl:template match="h:div[@id='es-setlike']|h:div[@id='idl-setlike']">
    </xsl:template>
    <!-- [ImplicitThis]: DONE -->
    <xsl:template match="h:div[@id='ImplicitThis']">
    </xsl:template>
    <!-- [Unscopeable] -->
    <xsl:template match="h:div[@id='Unscopeable']">
    </xsl:template>
    <!-- Regexp: DONE -->
    <xsl:template match="h:div[@id='idl-RegExp']|h:div[@id='es-RegExp']|h:li/h:span[position() = 1 and text()='RegExp']">
    </xsl:template>
    <xsl:template match="h:table[@id='distinguishable-table']">
        <table>
            <xsl:copy-of select='@*[namespace-uri()="" or namespace-uri="http://www.w3.org/XML/1998/namespace"]'/>
            <xsl:variable name="regex" select="h:tr/h:th[1][string()='RegExp']"/>
            <xsl:variable name="regexidx">
                <xsl:for-each select="h:tr[1]/*">
                    <xsl:if test="string()='RegExp'"><xsl:number value="position()"/></xsl:if>
                </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="*">
            <tr>
                <xsl:if test="./h:th[1] != $regex">
                    <xsl:for-each select="h:th|h:td">
                           <xsl:if test="position() != $regexidx">
                               <xsl:apply-templates select='.' />
                               <xsl:text>&#xa;</xsl:text>
                           </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </tr>
        </xsl:for-each>
        </table>
    </xsl:template>
    <!-- ArrayClass: DONE -->
    <xsl:template match="h:div[@id='ArrayClass']|h:li/h:a[@href='#ArrayClass']|h:a[@class='xattr' and @href='#ArrayClass']">
    </xsl:template>


    <!-- end of respec customization -->


  <xsl:template match='h:div[@class="ednote"]'>
    <div>
      <xsl:copy-of select='@*[namespace-uri()="" or namespace-uri="http://www.w3.org/XML/1998/namespace"]'/>
        <xsl:apply-templates select='node()'/>
    </div>
  </xsl:template>

  <xsl:template match='h:div[@class="warning"]'>
    <div>
      <xsl:copy-of select='@*[namespace-uri()="" or namespace-uri="http://www.w3.org/XML/1998/namespace"]'/>
            <xsl:apply-templates select='node()'/>
    </div>
  </xsl:template>

  <xsl:template match='h:div[@class="example"]'>
    <div>
      <xsl:copy-of select='@*[namespace-uri()="" or namespace-uri="http://www.w3.org/XML/1998/namespace"]'/>
      <div class='exampleHeader'>Example</div>
      <xsl:apply-templates select='node()'/>
    </div>
  </xsl:template>

  <xsl:template match='h:div[@class="note"]'>
    <div>
      <xsl:copy-of select='@*[namespace-uri()="" or namespace-uri="http://www.w3.org/XML/1998/namespace"]'/>
      <xsl:apply-templates select='node()'/>
    </div>
  </xsl:template>

  <!--
  <xsl:template match='h:tr'>
    <xsl:copy>
      <xsl:attribute name='class'>
        <xsl:value-of select='@class'/>
        <xsl:if test='@class'><xsl:text> </xsl:text></xsl:if>
        <xsl:choose>
          <xsl:when test='count(preceding-sibling::h:tr) mod 2 = 0'>odd</xsl:when>
          <xsl:otherwise>even</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:copy-of select='node()[not(self::class)]'/>
    </xsl:copy>
  </xsl:template>
  -->

  <xsl:template match='x:codeblock'>
    <div class='block'>
      <div class='blockTitleDiv'>
        <span class='blockTitle'>
          <xsl:choose>
            <xsl:when test='@language="idl"'>IDL</xsl:when>
            <xsl:when test='@language="es"'>ECMAScript</xsl:when>
            <xsl:when test='@language="java"'>Java</xsl:when>
            <xsl:when test='@language="c"'>C</xsl:when>
            <xsl:when test='@language="html"'>HTML</xsl:when>
            <xsl:otherwise>@@</xsl:otherwise>
          </xsl:choose>
        </span>
      </div>
      <div class='blockContent'>
        <pre class='code'><code class='{@language}-code'><xsl:apply-templates select='node()'/></code></pre>
      </div>
    </div>
  </xsl:template>

  <xsl:template match='x:grammar'>
    <table class='grammar'>
      <xsl:apply-templates select='x:prod'/>
    </table>
  </xsl:template>

  <xsl:template name='proddef'>
    <xsl:param name='prods'/>
    <xsl:param name='pi'/>
    <xsl:for-each select='$prods'>
      <xsl:variable name='nt' select='@nt'/>
      <tr>
        <xsl:if test='not($pi/preceding::processing-instruction("productions")[contains(concat(" ", substring-after(., " "), " "), concat(" ", $nt, " "))])'>
          <xsl:attribute name='id'>proddef-<xsl:value-of select='@nt'/></xsl:attribute>
        </xsl:if>
        <td><span class='prod-number'>[<xsl:value-of select='count(preceding-sibling::x:prod) + 1'/>]</span></td>
        <td>
          <a class='sym' href='#prod-{@nt}'><xsl:value-of select='@nt'/></a>
          <xsl:if test='@whitespace="explicit"'>
            <sub class='nt-attr'>explicit</sub>
          </xsl:if>
        </td>
        <td class='prod-mid'>→</td>
        <td class='prod-rhs'>
          <span class='prod-lines'>
            <xsl:call-template name='bnf'>
              <xsl:with-param name='s' select='string(.)'/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match='x:prod'>
    <tr id='prod-{@nt}'>
      <td><span class='prod-number'>[<xsl:value-of select='count(preceding-sibling::x:prod) + 1'/>]</span></td>
      <td>
        <xsl:choose>
          <xsl:when test='../@links="off"'>
            <xsl:value-of select='@nt'/>
          </xsl:when>
          <xsl:otherwise>
            <a class='sym' href='#proddef-{@nt}'><xsl:value-of select='@nt'/></a>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test='@whitespace="explicit"'>
          <sub class='nt-attr'>explicit</sub>
        </xsl:if>
      </td>
      <td class='prod-mid'>→</td>
      <td class='prod-rhs'>
        <span class='prod-lines'>
          <xsl:call-template name='bnf'>
            <xsl:with-param name='s' select='string(.)'/>
            <xsl:with-param name='links' select='../@links'/>
          </xsl:call-template>
        </span>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name='bnf'>
    <xsl:param name='s'/>
    <xsl:param name='mode' select='0'/>
    <xsl:param name='links'/>
    <xsl:if test='$s != ""'>
      <xsl:variable name='c' select='substring($s, 1, 1)'/>
      <xsl:choose>
        <xsl:when test='$mode = 0 and contains("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", $c)'>
          <xsl:variable name='nt'>
            <xsl:value-of select='$c'/>
            <xsl:call-template name='bnf-nt'>
              <xsl:with-param name='s' select='substring($s, 2)'/>
            </xsl:call-template>
          </xsl:variable>
            <!--
          <xsl:choose>
            <xsl:when test='$links="off"'>
              <xsl:value-of select='$nt'/>
            </xsl:when>
            <xsl:otherwise>
            -->
              <a class='sym' href='#prod-{$nt}'><xsl:value-of select='$nt'/></a>
            <!--
            </xsl:otherwise>
          </xsl:choose>
            -->
          <xsl:call-template name='bnf'>
            <xsl:with-param name='s' select='substring($s, string-length($nt) + 1)'/>
            <xsl:with-param name='links' select='$links'/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test='$mode = 0 and $c = "|"'>
          <!--div class='prod-line-subsequent'--><br/> |
            <xsl:call-template name='bnf'>
              <xsl:with-param name='s' select='substring($s, 2)'/>
              <xsl:with-param name='links' select='$links'/>
            </xsl:call-template>
          <!--/div-->
        </xsl:when>
        <xsl:when test='$c = &#39;"&#39;'>
          <xsl:value-of select='$c'/>
          <xsl:variable name='newMode'>
            <xsl:choose>
              <xsl:when test='$mode = 1'>0</xsl:when>
              <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:call-template name='bnf'>
            <xsl:with-param name='s' select='substring($s, 2)'/>
            <xsl:with-param name='mode' select='$newMode'/>
            <xsl:with-param name='links' select='$links'/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$c = &#34;'&#34;">
          <xsl:value-of select='$c'/>
          <xsl:variable name='newMode'>
            <xsl:choose>
              <xsl:when test='$mode = 2'>0</xsl:when>
              <xsl:otherwise>2</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:call-template name='bnf'>
            <xsl:with-param name='s' select='substring($s, 2)'/>
            <xsl:with-param name='mode' select='$newMode'/>
            <xsl:with-param name='links' select='$links'/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$c = '[' and $mode = 0">
          <xsl:value-of select='$c'/>
          <xsl:choose>
            <xsl:when test='substring($s, 2, 1) = "]"'>
              <xsl:text>]</xsl:text>
              <xsl:call-template name='bnf'>
                <xsl:with-param name='s' select='substring($s, 3)'/>
                <xsl:with-param name='links' select='$links'/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name='newMode'>
                <xsl:choose>
                  <xsl:when test='$mode = 3'>0</xsl:when>
                  <xsl:otherwise>3</xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:call-template name='bnf'>
                <xsl:with-param name='s' select='substring($s, 2)'/>
                <xsl:with-param name='mode' select='$newMode'/>
                <xsl:with-param name='links' select='$links'/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$c = ']' and $mode = 3">
          <xsl:value-of select='$c'/>
          <xsl:call-template name='bnf'>
            <xsl:with-param name='s' select='substring($s, 2)'/>
            <xsl:with-param name='links' select='$links'/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select='$c'/>
          <xsl:call-template name='bnf'>
            <xsl:with-param name='s' select='substring($s, 2)'/>
            <xsl:with-param name='mode' select='$mode'/>
            <xsl:with-param name='links' select='$links'/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name='bnf-nt'>
    <xsl:param name='s'/>
    <xsl:if test='$s != ""'>
      <xsl:variable name='c' select='substring($s, 1, 1)'/>
      <xsl:if test='contains("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz", $c)'>
        <xsl:value-of select='$c'/>
        <xsl:call-template name='bnf-nt'>
          <xsl:with-param name='s' select='substring($s, 2)'/>
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template match='*'/>

  <xsl:template match='comment()'>
    <xsl:copy/>
  </xsl:template>
</xsl:stylesheet>
