<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:variable name="projectpath"
                 select="'D:\All-SIL-Publishing\github-SILAsiaPub\PLB-dict-Prince\data\project'"/>
   <xsl:variable name="cd"
                 select="'D:\All-SIL-Publishing\github-SILAsiaPub\PLB-dict-Prince'"/>
   <xsl:variable name="true" select="tokenize('true yes on 1','\s+')"/>
   <xsl:variable name="comment1"
                 select="'# =================================================================='"/>
   <xsl:variable name="comment2" select="'# dict2web project variables '"/>
   <xsl:variable name="comment3" select="'# conforms to 201501 html creation templates'"/>
   <xsl:variable name="comment4">variable                                </xsl:variable>
   <xsl:param name="iso" select="'sse'"/>
   <xsl:variable name="comment5">variable                                </xsl:variable>
   <xsl:param name="langname" select="'Balangini'"/>
   <xsl:variable name="comment6">variable                                </xsl:variable>
   <xsl:param name="type" select="'plb'"/>
   <xsl:variable name="comment7">variable                                </xsl:variable>
   <xsl:param name="source" select="'sse-Dict-utf8.sfm'"/>
   <xsl:variable name="comment8">variable                                </xsl:variable>
   <xsl:param name="natlang" select="''"/>
   <xsl:variable name="comment9">variable                                </xsl:variable>
   <xsl:param name="reglang" select="''"/>
   <xsl:variable name="comment10">variable                                </xsl:variable>
   <xsl:param name="reg2lang" select="''"/>
   <xsl:variable name="comment11">variable                                </xsl:variable>
   <xsl:param name="reg3lang" select="''"/>
   <xsl:variable name="comment12">variable                                </xsl:variable>
   <xsl:param name="labelname" select="concat($langname,'')"/>
   <xsl:variable name="comment13">copyright                               </xsl:variable>
   <xsl:param name="copyright" select="'2014 SIL Philippines'"/>
   <xsl:variable name="comment14">variable                                </xsl:variable>
   <xsl:param name="splitseparator" select="';'"/>
   <xsl:variable name="comment15">variable                                </xsl:variable>
   <xsl:param name="intropage" select="concat('online-',$iso,'.html')"/>
   <xsl:variable name="comment16">variable                                </xsl:variable>
   <xsl:param name="title" select="concat('online-',$iso,'.html')"/>
   <xsl:variable name="comment17">variable                                </xsl:variable>
   <xsl:param name="voltitle"
              select="'Balangini-English Dictionary (work in progress 1980-2016)'"/>
   <xsl:variable name="comment18">variable                                </xsl:variable>
   <xsl:param name="htmlpath"
              select="concat('D:\All-SIL-PLB\WebMaster\plb-www\prog\',$iso,'1\dict\')"/>
   <xsl:variable name="comment20" select="'# collation settings for custom collation'"/>
   <xsl:variable name="comment21">variable                                </xsl:variable>
   <xsl:param name="collationname" select="''"/>
   <xsl:variable name="comment22">variable                                </xsl:variable>
   <xsl:param name="translateaccents" select="'no'"/>
   <xsl:variable name="comment23">variable                                </xsl:variable>
   <xsl:param name="customfind" select="''"/>
   <xsl:variable name="comment24">variable                                </xsl:variable>
   <xsl:param name="customreplace" select="''"/>
   <xsl:variable name="comment25">                                        </xsl:variable>
   <xsl:param name="decchartoremove" select="''"/>
   <xsl:variable name="comment26">                                        </xsl:variable>
   <xsl:param name="secondarysort" select="'lx'"/>
   <xsl:variable name="comment27">                                        </xsl:variable>
   <xsl:param name="removechar" select="''"/>
   <xsl:variable name="comment28">                                        </xsl:variable>
   <xsl:param name="groupingfield" select="'ie'"/>
   <xsl:variable name="comment29" select="'# pre-xml-ccts'"/>
   <xsl:variable name="comment30"
                 select="'#list of ccts for sfm pre checks         ;var prexmlccts &#34;fix_wedge_quotes.cct,sse-fixes-orthography.cct&#34;'"/>
   <xsl:variable name="comment31">list of ccts for sfm pre checks         </xsl:variable>
   <xsl:param name="prexmlccts"
              select="'fix-wedge-quotes.cct,fix-sfm-elemt-names.cct'"/>
   <xsl:variable name="comment32">ccts to run after all xml changes       </xsl:variable>
   <xsl:param name="postxmlccts" select="'inline2xmlv2.cct'"/>
   <xsl:variable name="comment33" select="'# key field groups for processing'"/>
   <xsl:variable name="comment34">fields to remove                        </xsl:variable>
   <xsl:param name="fields_to_remove_list" select="'dq dt ud pn mo eg'"/>
   <xsl:variable name="fields_to_remove" select="tokenize($fields_to_remove_list,'\s+')"/>
   <xsl:variable name="comment35">vernacular fields for linking           </xsl:variable>
   <xsl:param name="link_source_fields_list" select="'lx va'"/>
   <xsl:variable name="link_source_fields"
                 select="tokenize($link_source_fields_list,'\s+')"/>
   <xsl:variable name="comment36">fields to put links in                  </xsl:variable>
   <xsl:param name="link_target_fields_list"
              select="'re rf rg rt rm ro rs ra mb lc ld lk ls mr va'"/>
   <xsl:variable name="link_target_fields"
                 select="tokenize($link_target_fields_list,'\s+')"/>
   <xsl:variable name="comment37">                                        </xsl:variable>
   <xsl:param name="separatorpunctuation" select="','"/>
   <xsl:variable name="comment38">                                        </xsl:variable>
   <xsl:param name="fields_to_split_list" select="'gl'"/>
   <xsl:variable name="fields_to_split" select="tokenize($fields_to_split_list,'\s+')"/>
   <xsl:variable name="comment39">                                        </xsl:variable>
   <xsl:param name="indexes_to_build_list" select="'ver eng'"/>
   <xsl:variable name="indexes_to_build" select="tokenize($indexes_to_build_list,'\s+')"/>
   <xsl:variable name="comment40">source fields for English               </xsl:variable>
   <xsl:param name="index_source_fields_eng" select="'ie'"/>
   <xsl:variable name="comment41">source fields for Vernacular            </xsl:variable>
   <xsl:param name="index_source_fields_ver" select="'lx va'"/>
   <xsl:variable name="comment42">                                        </xsl:variable>
   <xsl:param name="spacebeforehom" select="''"/>
   <xsl:variable name="comment43"
                 select="'#index info combined                     ;var indexdata &#34;ver=lx va:eng=ie&#34;'"/>
   <xsl:variable name="comment44"
                 select="'#source fields for National              ;var index_source_fields_nat &#34;it&#34;'"/>
   <xsl:variable name="comment45"
                 select="'#source fields for Regional              ;var index_source_fields_reg &#34;&#34;'"/>
   <xsl:variable name="comment46"
                 select="'#source fields for Regional2             ;var index_source_fields_reg2 &#34;&#34;'"/>
   <xsl:variable name="comment47"
                 select="'#semicolon                               ;var semicolon ;'"/>
   <xsl:variable name="comment48"
                 select="'# the following sometimes needs need editing'"/>
   <xsl:variable name="comment49">set volsubtitle                         </xsl:variable>
   <xsl:param name="subtitle" select="''"/>
   <xsl:variable name="comment50">region                                  </xsl:variable>
   <xsl:param name="region" select="'Cordilliaras'"/>
   <xsl:variable name="comment51">country                                 </xsl:variable>
   <xsl:param name="country" select="'Philippines'"/>
   <xsl:variable name="comment52">Eng reversal/index field                </xsl:variable>
   <xsl:param name="engindex" select="'ie'"/>
   <xsl:variable name="comment53">English definition field                </xsl:variable>
   <xsl:param name="engdef" select="'gl'"/>
   <xsl:variable name="comment56"
                 select="'# ==========================================================================================='"/>
   <xsl:variable name="comment57" select="'# udict app variables'"/>
   <xsl:variable name="comment58">reverseurl                              </xsl:variable>
   <xsl:param name="revurl" select="concat('org.sil.dict.',$iso)"/>
   <xsl:variable name="comment59">remove space                            </xsl:variable>
   <xsl:param name="appname1" select="replace($voltitle,' ','')"/>
   <xsl:variable name="comment60">remove hyphen                           </xsl:variable>
   <xsl:param name="appname" select="replace($appname1,'-','')"/>
   <xsl:variable name="comment61"> accented char                          </xsl:variable>
   <xsl:param name="accentedchar" select="'áàâéèêíìîóòôùû'"/>
   <xsl:variable name="comment62"> unaccented char                        </xsl:variable>
   <xsl:param name="noaccentchar" select="'aaaeeeiiiooouu'"/>
   <xsl:variable name="comment63">definitions list                        </xsl:variable>
   <xsl:param name="definitions_list" select="'gl ie'"/>
   <xsl:variable name="definitions" select="tokenize($definitions_list,'\s+')"/>
   <xsl:variable name="comment65">keystore to use                         </xsl:variable>
   <xsl:param name="keystore" select="'dict.key'"/>
   <xsl:variable name="comment66">key alias                               </xsl:variable>
   <xsl:param name="keyalias" select="'dict'"/>
   <xsl:variable name="comment67">icon source                             </xsl:variable>
   <xsl:param name="appicon" select="'dictionary'"/>
   <xsl:variable name="comment68">icon source dir                         </xsl:variable>
   <xsl:param name="iconresourcepath" select="concat('resources\icons\',$appicon)"/>
   <xsl:variable name="comment69">icon resource part name                 </xsl:variable>
   <xsl:param name="iconrespartname" select="concat($appicon,'-icon')"/>
   <xsl:variable name="comment71">build subfolder                         </xsl:variable>
   <xsl:param name="buildsystem" select="'cordova'"/>
   <xsl:variable name="comment72" select="'# the following do not need changing'"/>
   <xsl:variable name="comment73">define app name from voltitle           </xsl:variable>
   <xsl:param name="app_name" select="concat($voltitle,'')"/>
   <xsl:variable name="comment74">key store path                          </xsl:variable>
   <xsl:param name="defaultkeystorepath" select="concat($cd,'\Android-keystore')"/>
   <xsl:variable name="comment75">keystore                                </xsl:variable>
   <xsl:param name="keystorefile" select="concat($defaultkeystorepath,'\',$keystore)"/>
   <xsl:variable name="comment76">set build path                          </xsl:variable>
   <xsl:param name="buildpath" select="concat($projectpath,'\',$buildsystem,'\www')"/>
   <xsl:variable name="comment77">android build path                      </xsl:variable>
   <xsl:param name="androidantbuildpath"
              select="concat($projectpath,'\',$buildsystem,'\platforms\android')"/>
   <xsl:variable name="comment78">ant propertis file                      </xsl:variable>
   <xsl:param name="antproperties"
              select="concat($androidantbuildpath,'\ant.properties')"/>
   <xsl:variable name="comment80"
                 select="'# ============================================================================='"/>
   <xsl:variable name="comment81" select="'# groupings for html generation'"/>
   <xsl:variable name="comment82">                                        </xsl:variable>
   <xsl:param name="prefile" select="'/lexicon/lx'"/>
   <xsl:variable name="comment83">                                        </xsl:variable>
   <xsl:param name="preurl" select="'../lexicon/lx'"/>
   <xsl:variable name="comment84"
                 select="'#                                        ;var groupsdivs_list &#34;psGroup glGroup snGroup vaGroup exGroup iiGroup itGroup ivGroup lsGroup liGroup lcGroup msGroup odeGroup oidGroup oseGroup raGroup rtGroup reGroup rfGroup rgGroup rsGroup scGroup ocGroup oaGroup&#34;'"/>
   <xsl:variable name="comment85"
                 select="'#                                        ;var sensehom_list &#34;ra re rg rs rt&#34;'"/>
   <xsl:variable name="comment86"
                 select="'#                                        ;var sensehomgrouped_list &#34;ra re rg rs rt&#34;'"/>
   <xsl:variable name="comment87"
                 select="'#                                        ;var omit_list &#34;no ie&#34;'"/>
   <xsl:variable name="comment88">                                        </xsl:variable>
   <xsl:param name="omitfields-html_list" select="'no'"/>
   <xsl:variable name="omitfields-html" select="tokenize($omitfields-html_list,'\s+')"/>
   <xsl:variable name="comment89">                                        </xsl:variable>
   <xsl:param name="omitfields-js_list" select="'ie'"/>
   <xsl:variable name="omitfields-js" select="tokenize($omitfields-js_list,'\s+')"/>
   <xsl:variable name="comment90">                                        </xsl:variable>
   <xsl:param name="translateabreviations" select="'ps oc'"/>
   <xsl:variable name="comment91">                                        </xsl:variable>
   <xsl:param name="abreviationsinlinelist" select="'oc'"/>
   <xsl:variable name="comment92"
                 select="'#                                        ;var serialnodesnothom &#34;ii iv it&#34;'"/>
   <xsl:variable name="comment93" select="'# HTML lists'"/>
   <xsl:variable name="comment94">group divs                              </xsl:variable>
   <xsl:param name="groupdivs_list"
              select="'psGroup glGroup snGroup vaGroup seGroup exGroup iiGroup itGroup ivGroup lsGroup liGroup lcGroup msGroup odeGroup oidGroup oseGroup raGroup rtGroup reGroup rfGroup rgGroup rsGroup scGroup ocGroup oaGroup'"/>
   <xsl:variable name="groupdivs" select="tokenize($groupdivs_list,'\s+')"/>
   <xsl:variable name="comment95"
                 select="'#                                        ;var inlinespans_list &#34;charbold charitalic charbolditalic&#34;'"/>
   <xsl:variable name="comment96">inlinespans                             </xsl:variable>
   <xsl:param name="inlinespans_list"
              select="'charbold charitalic charbolditalic strong em oa oi rf ad'"/>
   <xsl:variable name="inlinespans" select="tokenize($inlinespans_list,'\s+')"/>
   <xsl:variable name="comment97">sense and hom                           </xsl:variable>
   <xsl:param name="sensehom_list" select="'ra re rg rs rt'"/>
   <xsl:variable name="sensehom" select="tokenize($sensehom_list,'\s+')"/>
   <xsl:variable name="comment98">grouped sense hom                       </xsl:variable>
   <xsl:param name="sensehomgrouped_list" select="'ra re rg rs rt mr va'"/>
   <xsl:variable name="sensehomgrouped" select="tokenize($sensehomgrouped_list,'\s+')"/>
   <xsl:variable name="comment99">omit from output                        </xsl:variable>
   <xsl:param name="omit_list" select="'no ie'"/>
   <xsl:variable name="omit" select="tokenize($omit_list,'\s+')"/>
   <xsl:variable name="comment100">css translate list                      </xsl:variable>
   <xsl:param name="csstranslate_list" select="'ps oc'"/>
   <xsl:variable name="csstranslate" select="tokenize($csstranslate_list,'\s+')"/>
   <xsl:variable name="comment101">serial nodes                            </xsl:variable>
   <xsl:param name="serialnodesnothom_list" select="'ii iv it'"/>
   <xsl:variable name="serialnodesnothom"
                 select="tokenize($serialnodesnothom_list,'\s+')"/>
   <xsl:variable name="comment102"
                 select="'#pathe parts                             ;var prefile &#34;/lx&#34;'"/>
   <xsl:variable name="comment103"
                 select="'#pre url                                 ;var preurl &#34;../lexicon/lx&#34;'"/>
   <xsl:variable name="comment105"
                 select="'# ============================================================================'"/>
   <xsl:variable name="comment106" select="'# dfm specific variables'"/>
   <xsl:variable name="comment107">number of languages                     </xsl:variable>
   <xsl:param name="nolangs" select="'2'"/>
   <xsl:variable name="comment108">publisher                               </xsl:variable>
   <xsl:param name="publisher" select="'SIL Philippines'"/>
   <xsl:variable name="comment109">iso 2                                   </xsl:variable>
   <xsl:param name="iso2" select="'eng'"/>
   <xsl:variable name="comment110">iso 3                                   </xsl:variable>
   <xsl:param name="iso3" select="''"/>
   <xsl:variable name="comment111">iso 4                                   </xsl:variable>
   <xsl:param name="iso4" select="''"/>
   <xsl:variable name="comment112">publication date                        </xsl:variable>
   <xsl:param name="pubdate" select="'2014'"/>
   <xsl:variable name="comment114"
                 select="'# ============================================================================'"/>
   <xsl:variable name="comment115" select="'# fo variables'"/>
   <xsl:variable name="comment116">get before after file                   </xsl:variable>
   <xsl:param name="beforeafter-file"
              select="'resources\dict-plb-before-after-text.txt'"/>
   <xsl:variable name="comment117">block list elements                     </xsl:variable>
   <xsl:param name="foblock-list"
              select="'ps ad pl i b ar co dd1 dd2 de di ds ec eg ex gl ld li ls lx mb mo mr ms oa oi op pn re rf rg rs rt sn tb tr va'"/>
   <xsl:variable name="comment118">inline list                             </xsl:variable>
   <xsl:param name="foinline-list" select="'lxGroup msGroup'"/>
   <xsl:variable name="comment119">unwanted fields                         </xsl:variable>
   <xsl:param name="removefields-list" select="'ie'"/>
   <xsl:variable name="comment121">common param                            </xsl:variable>
   <xsl:param name="transfrom" select="'\/,.:'"/>
   <xsl:variable name="comment122">to                                      </xsl:variable>
   <xsl:param name="transto" select="'___'"/>
   <xsl:variable name="comment126"
                 select="'make xslt                               ;projectxslt'"/>
</xsl:stylesheet>
