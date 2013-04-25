# Dependencies

OPENJDK_DATE = 26_oct_2012
OPENJDK_SHA256SUM = 044c3877b15940ff04f8aa817337f2878a00cc89674854557f1a02f15b1802a0
OPENJDK_VERSION = b27
OPENJDK_URL = http://download.java.net/openjdk/jdk6/promoted/$(OPENJDK_VERSION)/

CACAO_VERSION = 68fe50ac34ec
CACAO_SHA256SUM = b8230f20d7022f9230bbfea13b2f3f179b2f42db40138ac6d32c82fc418ffc3a
CACAO_BASE_URL = http://icedtea.classpath.org/download/drops/cacao
CACAO_URL = $(CACAO_BASE_URL)/$(CACAO_VERSION).tar.gz
CACAO_SRC_ZIP = cacao-$(CACAO_VERSION).tar.gz

JAMVM_VERSION = 0972452d441544f7dd29c55d64f1ce3a5db90d82
JAMVM_SHA256SUM = bfa706402ac934d24f7119eb78f6be65e91439a4b2e49dbcc21e288137808f03
JAMVM_BASE_URL = http://icedtea.classpath.org/download/drops/jamvm
JAMVM_URL = $(JAMVM_BASE_URL)/jamvm-$(JAMVM_VERSION).tar.gz
JAMVM_SRC_ZIP = jamvm-$(JAMVM_VERSION).tar.gz

JAXWS_DROP_URL = http://icedtea.classpath.org/download/drops
JAXWS_DROP_ZIP = jdk6-jaxws2_1_6-2011_06_13.zip
JAXWS_DROP_SHA256SUM = 229040544e791f44906e8e7b6f6faf503c730a5d854275135f3925490d5c3be3
JAF_DROP_URL = http://icedtea.classpath.org/download/drops
JAF_DROP_ZIP = jdk6-jaf-b20.zip
JAF_DROP_SHA256SUM = 78c7b5c9d6271e88ee46abadd018a61f1e9645f8936cc8df1617e5f4f5074012
JAXP_DROP_URL = http://icedtea.classpath.org/download/drops
JAXP_DROP_ZIP = jaxp144_04.zip
JAXP_DROP_SHA256SUM = 490f696218c1fed9cb180680af883fe309b414fec232e9cec19645e12ad0b43c
OPENJDK_HG_URL = http://hg.openjdk.java.net/jdk6/jdk6

HOTSPOT_SRC_ZIP = hotspot.tar.gz

# Build directories

BUILD_DIR = @OPENJDK_BUILD_DIR@
BUILD_OUTPUT_DIR = $(abs_top_builddir)/$(BUILD_DIR)
DEBUG_BUILD_OUTPUT_DIR = $(BUILD_OUTPUT_DIR)-debug
ECJ_BUILD_OUTPUT_DIR = $(BUILD_OUTPUT_DIR)-ecj
ICEDTEA_CLS_DIR = $(BUILD_OUTPUT_DIR)/classes
ICEDTEA_CLS_DIR_ECJ = $(ECJ_BUILD_OUTPUT_DIR)/classes
BOOT_DIR = $(abs_top_builddir)/bootstrap/jdk1.6.0
ECJ_BOOT_DIR = $(abs_top_builddir)/bootstrap/ecj
ICEDTEA_BOOT_DIR = $(abs_top_builddir)/bootstrap/icedtea
JAMVM_IMPORT_PATH = $(abs_top_builddir)/jamvm/install/hotspot
SERVER_DIR = hotspot/import/jre/lib/$(INSTALL_ARCH_DIR)/server
BUILD_JRE_ARCH_DIR = $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
BUILD_DEBUG_JRE_ARCH_DIR = $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
FONTCONFIG_PATH = openjdk/jdk/src/solaris/classes/sun/awt/fontconfigs
REWRITER_BUILD_DIR = $(abs_top_builddir)/rewriter.build
GENERATED_BUILD_DIR = $(abs_top_builddir)/generated.build

# Source directories

SHARE = openjdk-ecj/jdk/src/share/classes
SOLARIS = openjdk-ecj/jdk/src/solaris/classes
LANGTOOLS = openjdk-ecj/langtools/src/share/classes
CORBA = openjdk-ecj/corba/src/share/classes

OPENJDK_SOURCEPATH_DIRS = \
        $(SHARE):$(SOLARIS):$(LANGTOOLS):$(CORBA)

SOURCEPATH_DIRS = $(abs_top_srcdir)/generated:$(OPENJDK_SOURCEPATH_DIRS)

# Sources used from OpenJDK.

ICEDTEA_BOOTSTRAP_CLASSES =

#PR42003 - Missing javax.swing.plaf.basic.BasicDirectoryModel methods cause OpenJDK build failure 
if LACKS_JAVAX_SWING_PLAF_BASIC_BASICDIRECTORYMODEL_ADDPROPERTYCHANGELISTENER
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/javax/swing/plaf/basic/BasicDirectoryModel.java
endif

# Workaround for old OpenJDK versions with older CORBA classes
if !LACKS_ORBUTILSYSTEMEXCEPTION
if LACKS_ORBUTILSYSTEMEXCEPTION_IOEXCEPTIONONCLOSE_THROWABLE
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(abs_top_srcdir)/generated/com/sun/corba/se/impl/logging/ORBUtilSystemException.java
endif
endif

# PR43389 - javax.management.StandardMBean
if LACKS_JAVAX_MANAGEMENT_STANDARDMBEAN_MXBEAN_TWO_ARG
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/javax/management/StandardMBean.java
else
if LACKS_JAVAX_MANAGEMENT_STANDARDMBEAN_MXBEAN_THREE_ARG
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/javax/management/StandardMBean.java
endif
endif

# PR54274 - sun.security.other requires missing X509CRLSelector methods
if LACKS_JAVA_SECURITY_CERT_X509CERTSELECTOR_GETSUBJECT
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/java/security/cert/X509CertSelector.java
else
if LACKS_JAVA_SECURITY_CERT_X509CERTSELECTOR_SETISSUER
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/java/security/cert/X509CertSelector.java
else
if LACKS_JAVA_SECURITY_CERT_X509CERTSELECTOR_SETSUBJECT
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/java/security/cert/X509CertSelector.java
endif
endif
endif
if LACKS_JAVA_SECURITY_CERT_X509CRLSELECTOR_ADDISSUER
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/java/security/cert/X509CRLSelector.java
if LACKS_JAVA_SECURITY_CERT_X509CRLSELECTOR_SETISSUERS
else
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/java/security/cert/X509CRLSelector.java
endif
endif

# PR41686 - Building sun.security.jgss.GSSUtil requires javax.security.auth.kerberos.KerberosTicket.getSessionKeyType()
if LACKS_JAVAX_SECURITY_AUTH_KERBEROS_KERBEROSTICKET_GETSESSIONKEYTYPE
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/javax/security/auth/kerberos/KerberosTicket.java
endif

# PR54275 - sun.security.sasl requires missing Sasl.CREDENTIALS field
if LACKS_JAVAX_SECURITY_SASL_SASL_CREDENTIALS
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/javax/security/sasl/Sasl.java
endif

#PR56553 - SSLParameters support missing
if LACKS_JAVAX_NET_SSL_SSLCONTEXT_GETDEFAULTSSLPARAMETERS
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/javax/net/ssl/SSLContext.java
endif
if LACKS_JAVAX_NET_SSL_SSLENGINE_SETSSLPARAMETERS
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/javax/net/ssl/SSLEngine.java
endif

#PR57030 - Add missing TrustAnchor methods
if LACKS_JAVA_SECURITY_CERT_TRUSTANCHOR_X500_CONS
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/java/security/cert/TrustAnchor.java
endif

#PR57031 - Add missing getParameters() method in KeyStoreBuilderParameters
if LACKS_JAVAX_NET_SSL_KEYSTOREBUILDERPARAMETERS_GETPARAMETERS
ICEDTEA_BOOTSTRAP_CLASSES += \
	$(SHARE)/javax/net/ssl/KeyStoreBuilderParameters.java
endif

# Flags
MEMORY_LIMIT = -J-Xmx1024m
IT_CFLAGS=$(CFLAGS) $(ARCHFLAG)
IT_JAVAC_SETTINGS=-g -encoding utf-8 $(JAVACFLAGS) $(MEMORY_LIMIT) $(PREFER_SOURCE)
IT_LANGUAGE_SOURCE_VERSION=6
IT_CLASS_TARGET_VERSION=6
IT_JAVACFLAGS=$(IT_JAVAC_SETTINGS) -source $(IT_LANGUAGE_SOURCE_VERSION) -target $(IT_CLASS_TARGET_VERSION)

# Conditional defintions

if USE_HG
  OPENJDK_SRC_ZIP = 
else
  OPENJDK_SRC_ZIP = openjdk-6-src-$(OPENJDK_VERSION)-$(OPENJDK_DATE).tar.gz
endif

# FIXME (HotSpot): HotSpot changeset logic goes here

if ENABLE_PULSE_JAVA
# include the makefile in pulseaudio subdir
PULSE_JAVA_DIR = $(abs_top_srcdir)/pulseaudio
PULSE_JAVA_NATIVE_SRCDIR = $(PULSE_JAVA_DIR)/src/native
PULSE_JAVA_NATIVE_SRCS = $(wildcard $(PULSE_JAVA_NATIVE_SRCDIR)/*.c)
PULSE_JAVA_BUILDDIR = $(abs_top_builddir)/pulseaudio.build
PULSE_JAVA_NATIVE_BUILDDIR = $(PULSE_JAVA_BUILDDIR)/native
PULSE_JAVA_NATIVE_OBJECTS = \
	$(subst $(PULSE_JAVA_NATIVE_SRCDIR),$(PULSE_JAVA_NATIVE_BUILDDIR),$(patsubst %.c,%.o,$(PULSE_JAVA_NATIVE_SRCS)))
PULSE_JAVA_JAVA_SRCDIR = $(PULSE_JAVA_DIR)/src/java
PULSE_JAVA_CLASS_DIR = $(PULSE_JAVA_BUILDDIR)/classes
PULSE_JAVA_TARGET = stamps/pulse-java.stamp
PULSE_JAVA_CLEAN_TARGET = clean-pulse-java
endif

if ENABLE_CACAO
  ICEDTEA_BUILD_TARGET=jdk_only
  ICEDTEA_DEBUG_BUILD_TARGET = jdk_fastdebug_only
else
if ENABLE_JAMVM
  ICEDTEA_BUILD_TARGET=jdk_only
  ICEDTEA_DEBUG_BUILD_TARGET = jdk_fastdebug_only
else
  ICEDTEA_DEBUG_BUILD_TARGET = debug_build
endif
endif

if BOOTSTRAPPING
  BOOTSTRAP_DIRECTORY_STAMP = stamps/bootstrap-directory.stamp
  ICEDTEA_HOME = $(ICEDTEA_BOOT_DIR)
  INITIAL_BOOTSTRAP_LINK_STAMP = stamps/bootstrap-directory-symlink-ecj.stamp
  RUNTIME = $(BOOT_DIR)/jre/lib/rt.jar
else
  BOOTSTRAP_DIRECTORY_STAMP =
  ICEDTEA_HOME = $(SYSTEM_JDK_DIR)
  INITIAL_BOOTSTRAP_LINK_STAMP = stamps/bootstrap-directory-symlink.stamp
  RUNTIME = $(BOOT_DIR)/jre/lib/rt.jar:$(BOOT_DIR)/jre/lib/jsse.jar
endif

if CP_SUPPORTS_REFLINK
  REFLINK = --reflink=auto
endif

if OPENJDK_SRC_DIR_HARDLINKABLE
  OPENJDK_SRC_DIR_LINK = -l
else
  OPENJDK_SRC_DIR_LINK = $(REFLINK)
endif

if SRC_DIR_HARDLINKABLE
  SRC_DIR_LINK = -l
else
  SRC_DIR_LINK = $(REFLINK)
endif

if !DISABLE_TESTS
if !DISABLE_HOTSPOT_TESTS
TEST_SUITES = hotspot
endif
if !DISABLE_JDK_TESTS
TEST_SUITES := $(TEST_SUITES) jdk
endif
if !DISABLE_LANGTOOLS_TESTS
TEST_SUITES := $(TEST_SUITES) langtools
endif
endif

# Target to ensure a patched OpenJDK tree containing Zero & Shark
# and any overlays is available in $(abs_top_builddir)/openjdk
OPENJDK_TREE = stamps/overlay.stamp

# Target to ensure a patched OpenJDK bootstrap tree containing
# Zero & Shark, any other overlays and the bootstrapping patches
# is available in $(abs_top_builddir)/openjdk-ecj
OPENJDK_ECJ_TREE = stamps/patch-ecj.stamp

# Sources list

REWRITER_SRCS = $(top_srcdir)/rewriter/com/redhat/rewriter/ClassRewriter.java
# Relative path to JTreg tool
JTREG_DIR = src/jtreg
JTREG_SRCS = $(top_srcdir)/$(JTREG_DIR)
TAPSET_TEST_SRCS = \
	$(top_srcdir)/test/tapset/ClassUnloadedProbeTester.java \
	$(top_srcdir)/test/tapset/JNIStapTest.c \
	$(top_srcdir)/test/tapset/JNITestClass.c \
	$(top_srcdir)/test/tapset/JNITestClass.h \
	$(top_srcdir)/test/tapset/JNITestClass.java \
	$(top_srcdir)/test/tapset/jstaptest.pl \
	$(top_srcdir)/test/tapset/RunWrapper.java \
	$(top_srcdir)/test/tapset/StapJNIClassLoader.java \
	$(top_srcdir)/test/tapset/StapURLClassLoader.java \
	$(top_srcdir)/test/tapset/SystemtapTester.java \
	$(top_srcdir)/test/tapset/TestingRunner.java

# Patch list

ICEDTEA_FSG_PATCHES =

SECURITY_PATCHES = \
	patches/security/20120830/7182135-impossible_to_use_some_editors_directly.patch \
	patches/security/20130201/7201068.patch \
	patches/security/20130201/6563318.patch \
	patches/security/20130201/6664509.patch \
	patches/security/20130201/6776941.patch \
	patches/security/20130201/7141694.patch \
	patches/security/20130201/7173145.patch \
	patches/security/20130201/7186945.patch \
	patches/security/20130201/7186948.patch \
	patches/security/20130201/7186952.patch \
	patches/security/20130201/7186954.patch \
	patches/security/20130201/7192392.patch \
	patches/security/20130201/7192393.patch \
	patches/security/20130201/7192977.patch \
	patches/security/20130201/7197546.patch \
	patches/security/20130201/7200491.patch \
	patches/security/20130201/7200500.patch \
	patches/security/20130201/7201064.patch \
	patches/security/20130201/7201066.patch \
	patches/security/20130201/7201070.patch \
	patches/security/20130201/7201071.patch \
	patches/security/20130201/8000210.patch \
	patches/security/20130201/8000537.patch \
	patches/security/20130201/8000540.patch \
	patches/security/20130201/8000631.patch \
	patches/security/20130201/8001242.patch \
	patches/security/20130201/8001972.patch \
	patches/security/20130201/8002325.patch \
	patches/security/20130201/8001235.patch \
	patches/security/20130219/8006446.patch \
	patches/security/20130219/8006777.patch \
	patches/security/20130219/8007688.patch \
	patches/security/20130304/8007014.patch \
	patches/security/20130304/8007675.patch \
	patches/openjdk/8009641-8007675_build_fix.patch \
	patches/security/20130416/7036559.patch \
        patches/security/20130416/8009063.patch

if !WITH_ALT_HSBUILD
SECURITY_PATCHES += \
	patches/security/20130201/8001307.patch
endif

SPECIAL_SECURITY_PATCH = patches/security/20120214/7112642.patch

ICEDTEA_PATCHES = \
	$(SECURITY_PATCHES) \
	patches/openjdk/4993545-nativeinlightfixer.patch \
	patches/openjdk/6637796-set_bounds.patch \
	patches/openjdk/6607660-treelock.patch \
	patches/openjdk/6607170-request_focus.patch \
	patches/openjdk/4685768-focus.patch \
	patches/openjdk/6616323-component_array.patch \
	patches/openjdk/6682046-shape_calculation.patch \
	patches/openjdk/6797195-hw_lw_mixing.patch \
	patches/openjdk/6725214-direct3d-01.patch \
	patches/openjdk/6748082-isDisplayLocal.patch \
	patches/openjdk/6633275-shaped_translucent_windows.patch \
	$(SPECIAL_SECURITY_PATCH) \
	patches/openjdk/6769607-modal-hangs.patch \
	patches/openjdk/6791612-opengl-jni-fix.patch \
	patches/openjdk/6755274-glgetstring-crash.patch \
	patches/openjdk/6984543-onscreen_rendering_resize_test.patch \
	patches/openjdk/6693253-security_warning.patch \
	patches/openjdk/6444769-windowwithwarningtest.patch \
	patches/notice-safepoints.patch \
	patches/parisc-opt.patch \
	patches/lucene-crash.patch \
	patches/version.patch \
	patches/openjdk/7043921-java_rmi_cgi.patch \
	patches/use-system-tzdata.patch \
	patches/headers.patch \
	patches/gcc-suffix.patch \
	patches/libraries.patch \
	patches/lcms.patch \
	patches/uname.patch \
	patches/freetypeversion.patch \
	patches/nomotif-6706121.patch \
	patches/nomotif.patch \
	patches/nomotif-mtoolkit.patch \
	patches/alt-jar.patch \
	patches/jdk-use-ssize_t.patch \
	patches/clean-crypto.patch \
	patches/arch.patch \
	patches/lc_ctype.patch \
	patches/xjc.patch \
	patches/linker-libs-order.patch \
	patches/testenv.patch \
	patches/samejvm-safe.patch \
	patches/pr261.patch \
	patches/sparc-buildfixes.patch \
	patches/sparc64-linux.patch \
	patches/jtreg-6592792.patch \
	patches/s390-noinline.patch \
	patches/jtreg-dnd.patch \
	patches/jtreg-jrunscript.patch \
	patches/network-unreachable.patch \
	patches/dnd-filelists.patch \
	patches/disable-cc-incompatible-sanity-checks.patch \
	patches/explicit-target-arch.patch \
	patches/parisc.patch \
	patches/policy-evaluation.patch \
	patches/openjdk/6959123-libpng_14.patch \
	patches/applet_hole.patch \
	patches/jtreg-httpTest.patch \
	patches/debug-dir.patch \
	patches/override-redirect-metacity.patch \
	patches/openjdk/6967533-pre_epoch.patch \
	patches/fonts-rhel.patch \
	patches/fonts-gentoo.patch \
	patches/ipv4-mapped-ipv6-addresses.patch \
	patches/jtreg-OpenGLContextInit.patch \
	patches/openjdk/6510892-httpserver_test.patch \
	patches/openjdk/6638712-wildcard_types.patch \
	patches/openjdk/6650759-missing_inference.patch \
	patches/jtreg-international-fonts.patch \
	patches/f14-fonts.patch \
	patches/jtreg-T6638712-fix.patch \
	patches/jtreg-T6650759m-fix.patch \
	patches/openjdk/7003777-bad-html-entity-parse.patch \
	patches/rendering-engine-tests.patch \
	patches/openjdk/6800846-printing-quality.patch \
	patches/rh661505-jpeg.patch \
	patches/6703377-freetypescaler.patch \
	patches/openjdk/6642612-filechooser_button_sizes.patch \
	patches/jtreg-international-fonts-styles.patch \
	patches/openjdk/6736649-text_bearings.patch \
	patches/openjdk/6797139-jbutton_truncation.patch \
	patches/openjdk/6883341-text_bearing_exception.patch \
	patches/jtreg-png-reader.patch \
	patches/openjdk/4724552-CubicCurve2D.patch \
	patches/openjdk/4493128-CubicCurve2D.patch \
	patches/openjdk/4645692-CubicCurve2D.solveCubic.patch \
	patches/g344659-sparc_fix.patch \
	patches/openjdk/6728834-blurred-lcd-aa-text.patch \
	patches/openjdk/6749060-bad-lcd-aa-non-opaque-dest.patch \
	patches/openjdk/6708580-exa_slow.patch \
	patches/openjdk/6896068-sg2d.patch \
	patches/openjdk/7021314-no_javaws_man_page.patch \
	patches/pr586-include_all_srcs.patch \
	patches/jtreg-LastErrorString.patch \
	patches/openjdk/6663040-com.sun.awt.patch \
	patches/openjdk/6775317-non-AA-simple-shape-performance.patch \
	patches/openjdk/6887494-NPE-in-pisces.patch \
	patches/openjdk/6967436-6967433-floating-pt-conversion.patch \
	patches/openjdk/6976265-stroke-control.patch \
	patches/openjdk/6967434-bad-round-joins.patch \
	patches/openjdk/6766342-AA-simple-shape-performance.patch \
	patches/openjdk/7016856-pisces-performance.patch \
	patches/openjdk/6934977-MappedByteBuffer.load.patch \
	patches/jtreg-hotspot-bug-6196102.patch \
	patches/jtreg-double-to-string.patch \
	patches/openjdk/7023591-AAShapePipe.patch \
	patches/openjdk/7027667-AAShapePipeRegTest.patch \
	patches/openjdk/7019861-AA-regression-fix.patch \
	patches/g356743-libpng-1.5.patch \
	patches/openjdk/6986968-crash_on_xim_restart.patch \
	patches/openjdk/7036754-stroker-nan.patch \
	patches/openjdk/pgram-pipe-regression.patch \
	patches/openjdk/mutter.patch \
	patches/fonts-rhel-version.patch \
	patches/openjdk/7036148-npe-null-jmenu-name.patch \
	patches/jtreg-ChangeDir.patch \
	patches/jtreg-TempBuffer.patch \
	patches/jtreg-EncodedMultiByteChar.patch \
	patches/jtreg-FileLoaderTest.patch \
	patches/jtreg-FileMap.patch \
	patches/jtreg-ChannelsWrite.patch \
	patches/jtreg-bug7036148-test.patch \
	patches/jtreg-ReadWriteProfileTest.patch \
	patches/openjdk/6818312-com.sun.awt.SecurityWarning.getSize.patch \
	patches/jtreg-MappedByteBuffer-Basic.patch \
	patches/openjdk/7008106-WindowOpacity.patch \
	patches/openjdk/6699843-IllegalArgumentException_drawString.patch \
	patches/openjdk/6918065-Crash_in_Java2D_blit_loop.patch \
	patches/openjdk/6623219-Font_canDisplayUpTo_does_not_work.patch \
	patches/openjdk/6783910-java_awt_Color_brighter_darker_fix.patch \
	patches/openjdk/6785424-SecurityException_locating_physical_fonts.patch \
	patches/openjdk/6679308-Poor_text_rendering_on_translucent_image.patch \
	patches/openjdk/6842838-64-bit_failure_in_handling_invalid_manifest.patch \
	patches/openjdk/6882768-test_for_6842838_is_broken.patch \
	patches/hotspot/$(HSBUILD)/pr639-broken_shark_build.patch \
	patches/powerpc-stacksize.patch \
	patches/openjdk/6711682-JCheckBox_in_JTable_does_not_respond_to_click.patch \
	patches/openjdk/6758179-D3D_AlphaComposite_is_applied_incorrectly.patch \
	patches/jtreg-ConstructDeflaterInput-fix.patch \
	patches/openjdk/6613904-GroupLayout_createParallelGroup_null_arg.patch \
	patches/openjdk/7049339-anyblit-broken.patch \
	patches/openjdk/4917091-javac_rejects_array_over_128_in_length.patch \
	patches/openjdk/6390045-error_cannot_access_java_lang_void.patch \
	patches/openjdk/6752638-preferLocaleFonts_throws_NPE.patch \
	patches/openjdk/5047314-Collator_compare_runs_indefinitely.patch \
	patches/openjdk/6669869-Beans_isDesignTime_should_be_per-AppContext.patch \
	patches/openjdk/6934356-Vector_writeObject_serialization_DL.patch \
	patches/openjdk/7036582-Improve_test_coverage_of_BigDecimal.patch \
	patches/openjdk/6806261-BigDecimal_longValueExact_throws_NPE.patch \
	patches/openjdk/6371401-BigInteger.shift_throws_StackOverflowError.patch \
	patches/openjdk/6826104-npe_on_app_and_toolkit_modal_dialog_click.patch \
	patches/openjdk/5082756-ImageIO_plugins_metadata_boolean_attributes.patch \
	patches/openjdk/6296893-BMP_Writer_handles_TopDown_prop_incorrectly.patch \
	patches/hotspot/$(HSBUILD)/arm-hsdis.patch \
	patches/openjdk/7103610-_NET_WM_PID_and_WM_CLIENT_MACHINE_are_not_set.patch \
	patches/openjdk/6706974-krb5_test_infrastructure.patch \
	patches/openjdk/6764553-IdResolver_is_not_thread_safe.patch \
	patches/openjdk/6761072-new_krb5_tests_fail_on_multiple_platforms.patch \
	patches/ScriptEngineManager-doc.patch \
	patches/openjdk/6883983-JarVerifier_removed_dependency_sun_security_pkcs.patch \
	patches/openjdk/4465490-Suspicious_double-check_locking_idiom.patch \
	patches/idresolver_fix.patch \
	patches/apache-xml-internal-fix-bug-38655.patch \
	patches/openjdk/6792400-Avoid_loading_Normalizer_resources.patch \
	patches/openjdk/7088989-ucrypto_tests.patch \
	patches/generalise_crypto_tests.patch \
	patches/remove-gcm-test.patch \
	patches/skip_wrap_mode.patch \
	patches/remove_multicatch_in_testrsa.patch \
	patches/openjdk/p11cipher-4898461-support_ecb_and_cbc.patch \
	patches/openjdk/p11cipher-6682411-fix_indexoutofboundsexception.patch \
	patches/openjdk/p11cipher-6682417-fix_decrypted_data_not_multiple_of_blocks.patch \
	patches/openjdk/p11cipher-6812738-native_cleanup.patch \
	patches/openjdk/p11cipher-6867345-turkish_regional_options_cause_npe_in_algoid.patch \
	patches/openjdk/p11cipher-6687725-throw_illegalblocksizeexception.patch \
	patches/openjdk/p11cipher-6924489-ckr_operation_not_initialized.patch \
	patches/openjdk/p11cipher-6604496-support_ckm_aes_ctr.patch \
	patches/openjdk/p11cipher-6414899-p11digest_should_support_cloning.patch \
	patches/merge_fix.patch \
	patches/openjdk/6763340-corba_memory_leak.patch \
	patches/openjdk/6980681-corba_deadlock.patch \
	patches/openjdk/7162902-corba_fixes.patch \
	patches/traceable.patch \
	patches/openjdk/8005615-failure_to_load_logger_implementation.patch \
	patches/openjdk/8004341-jck_dialog_failure.patch \
	patches/pr1319-support_giflib_5.patch \
	patches/openjdk/8007393.patch \
	patches/openjdk/8007611.patch \
	patches/copy_memory.patch \
	patches/openjdk/6718364-inference_failure.patch \
	patches/openjdk/6682380-foreach_crash.patch \
	patches/openjdk/7046929-fix_t6397104_test_failure.patch \
	patches/openjdk/7024568-long_method_resolution_oom_error.patch \
	patches/openjdk/7003595-incompatibleclasschangeerror.patch \
	patches/openjdk/6500343-bad_code_from_conditionals.patch

if WITH_ALT_HSBUILD
ICEDTEA_PATCHES += \
	patches/hotspot/hs23/remove_jsr292_tests.patch \
	patches/hotspot/hs23/revert-7017193.patch
else
# stdc-limit-macros is part of 7032458
# pr690-shark-jit-hs20.patch is part of 7032458
# pr696-zero-fast_aldc-hs20.patch is 7030207 & part of 7032458
ICEDTEA_PATCHES += \
	patches/stdc-limit-macros.patch \
	patches/version-hotspot.patch \
	patches/text-relocations.patch \
	patches/gcc-suffix-hotspot.patch \
	patches/memory-limits.patch \
	patches/print_lsb_release.patch \
	patches/alpha-fixes.patch \
	patches/use-idx_t.patch \
	patches/params-cast-size_t.patch \
	patches/sparc-ptracefix.patch \
	patches/sparc-trapsfix.patch \
	patches/openjdk/7019808-stack_noexec.patch \
	patches/sh4-support.patch \
	patches/update-bootclasspath.patch \
	patches/arm.patch \
	patches/numa_on_early_glibc.patch \
	patches/jtreg-6929067-fix.patch \
	patches/ia64-fix.patch \
	patches/openjdk/7041156-gcc_export_dynamic.patch \
	patches/openjdk/7032388-work_without_cmov_instruction.patch \
	patches/openjdk/7031385-gcc-register-allocation-fix.patch \
	patches/openjdk/7034464-transparent_huge_pages.patch \
	patches/openjdk/7037939-disable_adaptive_resizing_with_large_pages.patch \
	patches/openjdk/7043564-hugepage.patch \
	patches/openjdk/6956668-misbehavior_of_XOR_operator_with_int.patch \
	patches/openjdk/7047069-Array_can_dynamically_change_size.patch \
	patches/openjdk/6796786-invalid_FP_identity_transform.patch \
	patches/openjdk/7042070-Typo_in_Test6796786.patch \
	patches/jtreg-remove-test-6987555.patch \
	patches/jtreg-remove-test-6991596.patch \
	patches/openjdk/7036220-shark_llvm_29_headers.patch \
	patches/openjdk/7029152-String_intrinsics_miss_optimization.patch \
	patches/jtreg-hotspot-Test7020373-fix.patch \
	patches/pr690-shark-jit-hs20.patch \
	patches/pr696-zero-fast_aldc-hs20.patch \
	patches/arm-debug.patch \
	patches/openjdk/7010849-modernise_sa.patch \
	patches/hotspot/original/7197906-handle_32_bit_shifts.patch \
	patches/hotspot/original/fix_get_stack_bounds_leak.patch \
	patches/hotspot/original/jvmtiEnv.patch \
	patches/hotspot/original/6840152-jvm_crashes_with_heavyweight_monitors.patch
endif

# Needs to be after the addition of SH support to the original HotSpot
ICEDTEA_PATCHES += patches/aarch64.patch

if WITH_RHINO
ICEDTEA_PATCHES += \
	patches/rhino.patch
endif

if BUILD_CACAO
ICEDTEA_PATCHES += \
	patches/cacao/launcher.patch \
	patches/cacao/memory.patch \
	patches/cacao/hotspot/$(HSBUILD)/memory.patch \
	patches/cacao/armhf.patch
else
if USING_CACAO
ICEDTEA_PATCHES += \
	patches/cacao/memory.patch \
	patches/cacao/hotspot/$(HSBUILD)/memory.patch
endif
endif

if ENABLE_PULSE_JAVA
ICEDTEA_PATCHES += \
	patches/pulse-soundproperties.patch
endif

if ENABLE_XRENDER
ICEDTEA_PATCHES += patches/openjdk/6307603-xrender-01.patch \
	patches/openjdk/6961633-xrender-02.patch \
	patches/openjdk/7018387-xrender_gc_leak.patch
endif

if ENABLE_SYSTEMTAP
if WITH_ALT_HSBUILD
ICEDTEA_PATCHES += patches/hotspot/hs23/systemtap.patch
else
ICEDTEA_PATCHES += patches/hotspot/original/sdt-jni.patch \
	patches/hotspot/original/sdt-dtrace-hpp.patch \
	patches/hotspot/original/sdt-make.patch \
	patches/hotspot/original/sdt-arguments.patch \
	patches/systemtap-gcc-4.5.patch
endif
ICEDTEA_PATCHES += \
	patches/hotspot/$(HSBUILD)/systemtap_gc.patch \
	patches/hotspot/$(HSBUILD)/systemtap-alloc-size-workaround.patch
endif

if ENABLE_NSS
NSS_PATCHES = patches/nss-config.patch
else
NSS_PATCHES = patches/nss-not-enabled-config.patch
endif

if WITH_PAX
ICEDTEA_PATCHES += \
	patches/no-test_gamma.patch \
	patches/pax-mark-rmic-java.patch
endif

ICEDTEA_PATCHES += $(DISTRIBUTION_PATCHES)

# Bootstrapping patches

ICEDTEA_ECJ_PATCHES = \
	patches/ecj/icedtea.patch \
	patches/ecj/javafiles.patch \
	patches/ecj/spp.patch \
	patches/ecj/jopt.patch \
	patches/ecj/jaxp-dependency.patch \
	patches/ecj/bootver.patch \
	patches/ecj/getannotation-cast.patch \
	patches/ecj/override.patch \
	patches/ecj/xsltproc.patch \
	patches/ecj/corba-dependencies.patch \
	patches/ecj/jaxws-langtools-dependency.patch \
	patches/ecj/jaxws-jdk-dependency.patch \
	patches/ecj/hotspot/$(HSBUILD)/hotspot-jdk-dependency.patch

if DTDTYPE_QNAME
ICEDTEA_ECJ_PATCHES += \
	patches/ecj/jaxws-getdtdtype.patch
endif

if ENABLE_XRENDER
ICEDTEA_ECJ_PATCHES += patches/ecj/needs-6.patch
if CP40188_JAVAH
ICEDTEA_ECJ_PATCHES += patches/ecj/cp40188-opengl.patch
endif
endif

if !WITH_PAX
ICEDTEA_ECJ_PATCHES += patches/ecj/no-test_gamma.patch
endif

ICEDTEA_ECJ_PATCHES += $(DISTRIBUTION_ECJ_PATCHES)

# OpenJDK build environment.
if ZERO_BUILD
  ICEDTEA_ZERO_BUILD = true
else
  ICEDTEA_ZERO_BUILD =
endif
if SHARK_BUILD
  ICEDTEA_SHARK_BUILD = true
else
  ICEDTEA_SHARK_BUILD =
endif

JDK_UPDATE_VERSION = $(shell echo $(OPENJDK_VERSION) | sed -e "s/^b//")
COMBINED_VERSION = $(JDK_UPDATE_VERSION)-$(OPENJDK_VERSION)

ICEDTEA_NAME = IcedTea6
if HAS_ICEDTEA_REVISION
ICEDTEA_REV = +${ICEDTEA_REVISION}
endif
if HAS_PKGVERSION
ICEDTEA_PKG = $(EMPTY) (${PKGVERSION})
endif

ICEDTEA_ENV = \
	ALT_JDK_IMPORT_PATH="$(BOOT_DIR)" \
	ANT="$(ANT)" \
        BUILD_NUMBER="$(OPENJDK_VERSION)" \
	JDK_UPDATE_VERSION="$(JDK_UPDATE_VERSION)" \
        JRE_RELEASE_VERSION="1.6.0_$(COMBINED_VERSION)" \
	MILESTONE="fcs" \
	LANG="C" \
	PATH="$(BOOT_DIR)/bin:$(OS_PATH):$$PATH" \
	ALT_BOOTDIR="$(BOOT_DIR)" \
	BUILD_ARCH_DIR="$(BUILD_ARCH_DIR)" \
	ICEDTEA_CLS_DIR="$(ICEDTEA_CLS_DIR)" \
	CLASSPATH="" \
	LD_LIBRARY_PATH="" \
	ZERO_BUILD="$(ICEDTEA_ZERO_BUILD)" \
	SHARK_BUILD="$(ICEDTEA_SHARK_BUILD)" \
	ZERO_LIBARCH="$(ZERO_LIBARCH)" \
	ARCH_DATA_MODEL="$(ZERO_BITSPERWORD)" \
	ZERO_ENDIANNESS="$(ZERO_ENDIANNESS)" \
	ZERO_ARCHDEF="$(ZERO_ARCHDEF)" \
	ZERO_ARCHFLAG="$(ARCHFLAG)" \
	LIBFFI_CFLAGS="$(LIBFFI_CFLAGS)" \
	LIBFFI_LIBS="$(LIBFFI_LIBS)" \
	LLVM_CFLAGS="$(LLVM_CFLAGS)" \
	LLVM_LDFLAGS="$(LLVM_LDFLAGS)" \
	LLVM_LIBS="$(LLVM_LIBS)" \
	FREETYPE2_HEADERS="$(FREETYPE2_CFLAGS)" \
	FT2_LIB="$(FREETYPE2_LIBS)" \
	ALT_PARALLEL_COMPILE_JOBS="$(PARALLEL_JOBS)" \
	HOTSPOT_BUILD_JOBS="$(PARALLEL_JOBS)" \
	JAVAC="" \
	JAVA_HOME="" \
	JDK_HOME="" \
	ANT_RESPECT_JAVA_HOME="TRUE" \
	DISTRIBUTION_ID="$(DIST_ID)" \
	DERIVATIVE_ID="$(ICEDTEA_NAME) $(PACKAGE_VERSION)$(ICEDTEA_REV)" \
	DEBUG_CLASSFILES="true" \
	DEBUG_BINARIES="true" \
	ALT_DROPS_DIR="$(abs_top_builddir)/drops" \
	VERBOSE="$(VERBOSE)" \
	ALT_OUTPUTDIR="$(BUILD_OUTPUT_DIR)" \
	STATIC_CXX="false"

if WITH_ALT_HSBUILD
ICEDTEA_ENV += \
	BUILD_GCC=gcc$(GCC_SUFFIX) \
	BUILD_CXX=g++$(GCC_SUFFIX)
endif

if ENABLE_CACAO
ICEDTEA_ENV += \
	ALT_HOTSPOT_IMPORT_PATH="$(CACAO_IMPORT_PATH)"
endif

if ENABLE_JAMVM
ICEDTEA_ENV += \
	ALT_HOTSPOT_IMPORT_PATH="$(JAMVM_IMPORT_PATH)"
endif

if DISABLE_OPTIMIZATIONS
ICEDTEA_ENV += \
	NO_OPTIMIZATIONS="true" \
	CC_NO_OPT="-O0 -g"
endif

if !ENABLE_DOCS
ICEDTEA_ENV += \
	NO_DOCS="true"
endif

if ENABLE_CROSS_COMPILATION
ICEDTEA_ENV += \
	CROSS_COMPILATION="true" \
	CROSS_TARGET_ARCH="$(CROSS_TARGET_ARCH)"
endif

if USE_ALT_JAR
ICEDTEA_ENV += \
	ALT_JAR_CMD="$(ALT_JAR_CMD)"
endif

if HAS_HOTSPOT_REVISION
ICEDTEA_ENV += \
	HOTSPOT_BUILD_VERSION="$(HOTSPOT_REVISION)" 
endif

if WITH_RHINO
ICEDTEA_ENV += \
	RHINO_JAR="$(abs_top_builddir)/rhino/rhino.jar"
endif

# OpenJDK ecj build environment.
ICEDTEA_ENV_ECJ = $(ICEDTEA_ENV) \
	ALT_OUTPUTDIR="$(ECJ_BUILD_OUTPUT_DIR)" \
	JAVA_TOOLS_DIR="$(BOOT_DIR)/bin" \
	ICEDTEA_RT="$(RUNTIME)" \
	ICEDTEA_CLS_DIR="$(ICEDTEA_CLS_DIR_ECJ)" \
	BOOTCLASSPATH_CLS_RT="-bootclasspath $(ICEDTEA_CLS_DIR_ECJ):$(RUNTIME)" \
	BOOTCLASSPATH_CLS="-bootclasspath $(ICEDTEA_CLS_DIR_ECJ)" \
	BOOTCLASSPATH_RT_LIBGCJ="-bootclasspath $(RUNTIME)" \
	CLASSPATH="" \
	LD_LIBRARY_PATH="" \
	GENSRCDIR="$(GENERATED_BUILD_DIR)" \
	JAR_KNOWS_ATFILE="$(JAR_KNOWS_ATFILE)" \
	JAR_KNOWS_J_OPTIONS="$(JAR_KNOWS_J_OPTIONS)" \
	JAR_ACCEPTS_STDIN_LIST="$(JAR_ACCEPTS_STDIN_LIST)" \
	DISABLE_NIMBUS="true" \
	NO_DOCS="true" \
	XSLT="$(XSLTPROC)"

# Source files
# FIXME (distclean): Add generated file list
# FIXME (distclean): Add jtreg sources
# FIXME (distclean): Add pulseaudio sources

EXTRA_DIST = generated \
	$(top_srcdir)/patches/* \
	contrib arm_port \
	overlays \
	jconsole.desktop policytool.desktop \
	$(JTREG_SRCS) HACKING pulseaudio fsg.sh \
	hotspot.map \
	autogen.sh \
	tapset/hotspot.stp.in \
	tapset/hotspot_jni.stp.in \
	tapset/jstack.stp.in \
	tapset/hotspot_gc.stp.in \
	scripts/jni_create_stap.c \
	scripts/jni_desc \
	rewriter/agpl-3.0.txt \
	$(REWRITER_SRCS) \
	$(TAPSET_TEST_SRCS)

# Top-Level Targets
# =================

all-local: icedtea-against-icedtea

check-local: jtregcheck check-tapset

clean-tests: clean-jtreg clean-tapset-report
	if [ $(abs_top_srcdir) != $(abs_top_builddir) ] ; then \
	  if [ -e test ] ; then \
	    rmdir test ; \
	  fi \
	fi

clean-local: clean-tests $(PULSE_JAVA_CLEAN_TARGET) \
 clean-icedtea clean-icedtea-debug clean-icedtea-ecj clean-extract clean-ports \
 clean-overlay clean-native-ecj clean-icedtea-against-icedtea clean-icedtea-debug-against-icedtea \
 clean-icedtea-against-ecj clean-extract-ecj clean-generated clean-replace-hotspot \
 clean-rewriter clean-rewrite-rhino clean-rt clean-bootstrap-directory \
 clean-bootstrap-directory-ecj clean-bootstrap-directory-symlink \
 clean-bootstrap-directory-symlink-ecj clean-fonts
	if [ -e bootstrap ]; then \
	  rmdir bootstrap ; \
	fi
	if [ -e lib ]; then \
	  rmdir lib ; \
	fi

distclean-local: clean-local clean-download clean-hgforest
	if [ $(abs_top_srcdir) != $(abs_top_builddir) ]; then \
	  if [ -e tapset ] ; then \
	    rmdir tapset ; \
	  fi ; \
	fi
	if [ -e stamps ]; then \
	  rmdir stamps ; \
	fi

install:

.PHONY: \
	env env-ecj snapshot clean-clone clean-patch \
	clean-clone-ecj clean-patch-ecj clean-bootstrap-directory \
	clean-bootstrap-directory-symlink clean-bootstrap-directory-ecj \
	clean-bootstrap-directory-symlink-ecj icedtea icedtea-debug \
	clean-icedtea icedtea-against-icedtea clean-icedtea-ecj \
	clean-tools-jar clean-copy clean-rt hotspot \
	hotspot-helper clean-extra clean-jtreg clean-jtreg-reports \
	clean-add-zero clean-add-zero-debug clean-icedtea clean-icedtea-debug \
	clean-icedtea-against-ecj \
	clean-jamvm clean-add-jamvm clean-add-jamvm-debug \
	clean-cacao clean-add-cacao clean-add-cacao-debug \
	clean-ports clean-overlay clean-extract-ecj clean-extract clean-extract-openjdk \
	clean-replace-hotspot clean-generated clean-download clean-hgforest clean-download-openjdk \
	clean-rewriter clean-rewrite-rhino clean-add-systemtap clean-add-systemtap-debug \
	clean-add-pulseaudio clean-add-pulseaudio-debug clean-add-nss clean-add-nss-debug \
	clean-add-tzdata-support clean-add-tzdata-support-debug clean-add-systemtap-ecj \
	clean-add-pulseaudio-ecj clean-add-nss-ecj clean-add-tzdata-support-ecj clean-fonts \
	clean-download-hotspot clean-tests clean-tapset-report jtregcheck clean-pax-mark-vm \
	clean-pax-mark-vm-debug clean-pax-mark-vm-ecj

env:
	@echo 'unset JAVA_HOME'
	@echo 'export $(ICEDTEA_ENV)'

env-ecj:
	@echo 'unset JAVA_HOME'
	@echo 'export $(ICEDTEA_ENV_ECJ)'

# Mercurial snapshot.
snapshot: dist
	mv $(DIST_ARCHIVES) $(distdir)-`$(HG) tip --template '{node}'`.tar.gz

# fsg-tarball

# Creates archive of openjdk that is compliant with Free Software guidelines.
dist-openjdk-fsg: stamps/patch-fsg.stamp
	$(ZIP) -r openjdk-fsg-$(OPENJDK_VERSION) openjdk/

# OpenJDK Source Preparation Targets
# ==================================

# Download OpenJDK sources.

stamps/hgforest.stamp:
if !USE_HG
else
	if ! $(HG) fclone -h; \
          then \
          echo "No forest extension found. Please refer to" \
            "http://selenic.com/mercurial/wiki/index.cgi/ForestExtension"; \
          exit 1; \
          fi;
endif
	mkdir -p stamps 
	touch stamps/hgforest.stamp

clean-hgforest:
	rm -f stamps/hgforest.stamp

stamps/download-jaxp-drop.stamp:
	mkdir -p drops
if USE_ALT_JAXP_DROP_ZIP
	ln -sf $(ALT_JAXP_DROP_ZIP) drops/$(JAXP_DROP_ZIP)
endif
	if ! echo "$(JAXP_DROP_SHA256SUM)  drops/$(JAXP_DROP_ZIP)" \
	  | $(SHA256SUM) --check ; \
	then \
	  if test "x$(enable_downloading)" = "xyes"; then \
	    if [ -f drops/$(JAXP_DROP_ZIP) ] ; \
	    then \
	      mv drops/$(JAXP_DROP_ZIP) drops/$(JAXP_DROP_ZIP).old ; \
	    fi ; \
	    $(WGET) $(JAXP_DROP_URL)/$(JAXP_DROP_ZIP) -O drops/$(JAXP_DROP_ZIP); \
	    if ! echo "$(JAXP_DROP_SHA256SUM)  drops/$(JAXP_DROP_ZIP)" \
	      | $(SHA256SUM) --check ; \
	      then echo "ERROR: Bad download of jaxp drop zip"; false; \
	    fi; \
	  else \
	    echo "ERROR: No up-to-date JAXP drop zip available"; exit -1; \
	  fi ; \
	fi ;
	mkdir -p stamps
	touch $@

clean-download-jaxp-drop:
	rm -f drops/$(JAXP_DROP_ZIP)
	rm -f stamps/download-jaxp-drop.stamp

stamps/download-jaf-drop.stamp:
	mkdir -p drops
if USE_ALT_JAF_DROP_ZIP
	ln -sf $(ALT_JAF_DROP_ZIP) drops/$(JAF_DROP_ZIP)
endif
	if ! echo "$(JAF_DROP_SHA256SUM)  drops/$(JAF_DROP_ZIP)" \
	  | $(SHA256SUM) --check ; \
	then \
	  if test "x$(enable_downloading)" = "xyes"; then \
	    if [ -f drops/$(JAF_DROP_ZIP) ] ; \
	    then \
	      mv drops/$(JAF_DROP_ZIP) drops/$(JAF_DROP_ZIP).old ; \
	    fi ; \
	    $(WGET) $(JAF_DROP_URL)/$(JAF_DROP_ZIP) -O drops/$(JAF_DROP_ZIP); \
	    if ! echo "$(JAF_DROP_SHA256SUM)  drops/$(JAF_DROP_ZIP)" \
	      | $(SHA256SUM) --check ; \
	      then echo "ERROR: Bad download of jaf drop zip"; false; \
	    fi; \
	  else \
	    echo "ERROR: No up-to-date JAF drop zip available"; exit -1; \
	  fi; \
	fi ;
	mkdir -p stamps
	touch $@

clean-download-jaf-drop:
	rm -f drops/$(JAF_DROP_ZIP)
	rm -f stamps/download-jaf-drop.stamp

stamps/download-jaxws-drop.stamp:
	mkdir -p drops
if USE_ALT_JAXWS_DROP_ZIP
	ln -sf $(ALT_JAXWS_DROP_ZIP) drops/$(JAXWS_DROP_ZIP)
endif
	if ! echo "$(JAXWS_DROP_SHA256SUM)  drops/$(JAXWS_DROP_ZIP)" \
	  | $(SHA256SUM) --check ; \
	then \
	  if test "x$(enable_downloading)" = "xyes"; then \
	    if [ -f drops/$(JAXWS_DROP_ZIP) ] ; \
	    then \
	      mv drops/$(JAXWS_DROP_ZIP) drops/$(JAXWS_DROP_ZIP).old ; \
	    fi ; \
	    $(WGET) $(JAXWS_DROP_URL)/$(JAXWS_DROP_ZIP) -O drops/$(JAXWS_DROP_ZIP); \
	    if ! echo "$(JAXWS_DROP_SHA256SUM)  drops/$(JAXWS_DROP_ZIP)" \
	      | $(SHA256SUM) --check ; \
	      then echo "ERROR: Bad download of jaxws drop zip"; false; \
	    fi; \
	  else \
	    echo "ERROR: No up-to-date JAXWS drop zip available"; exit -1; \
	  fi; \
	fi ;
	mkdir -p stamps
	touch $@

clean-download-jaxws-drop:
	rm -f drops/$(JAXWS_DROP_ZIP)
	rm -f stamps/download-jaxws-drop.stamp

stamps/download-drops.stamp: stamps/download-jaxp-drop.stamp \
 stamps/download-jaxws-drop.stamp stamps/download-jaf-drop.stamp
	mkdir -p stamps
	touch $@

stamps/download-cacao.stamp:
if BUILD_CACAO
if !USE_SYSTEM_CACAO
if !USE_ALT_CACAO_SRC_DIR
if USE_ALT_CACAO_SRC_ZIP
	ln -sf $(ALT_CACAO_SRC_ZIP) $(CACAO_SRC_ZIP)
endif
	if ! echo "$(CACAO_SHA256SUM)  $(CACAO_SRC_ZIP)" \
	 | $(SHA256SUM) --check ; \
	then \
	 if test "x$(enable_downloading)" = "xyes"; then \
	   if [ -e $(CACAO_SRC_ZIP) ] ; then \
	     mv $(CACAO_SRC_ZIP) $(CACAO_SRC_ZIP).old ; \
	   fi ; \
	   $(WGET) $(CACAO_URL) -O $(CACAO_SRC_ZIP); \
	   if ! echo "$(CACAO_SHA256SUM)  $(CACAO_SRC_ZIP)" \
	     | $(SHA256SUM) --check ; then \
	     echo "ERROR: Bad download of CACAO zip"; false; \
	   fi; \
	 else \
	   echo "ERROR: No up-to-date CACAO zip available"; exit -1; \
	 fi ; \
	fi
endif
endif
endif
	mkdir -p stamps
	touch $@

clean-download-cacao:
	rm -f $(CACAO_SRC_ZIP)
	rm -f stamps/download-cacao.stamp

stamps/download-jamvm.stamp:
if BUILD_JAMVM
if USE_ALT_JAMVM_SRC_ZIP
	ln -sf $(ALT_JAMVM_SRC_ZIP) $(JAMVM_SRC_ZIP)
endif
	if ! echo "$(JAMVM_SHA256SUM)  $(JAMVM_SRC_ZIP)" \
	 | $(SHA256SUM) --check ; \
	then \
	  if test "x$(enable_downloading)" = "xyes"; then \
	    if [ -e $(JAMVM_SRC_ZIP) ] ; then \
	      mv $(JAMVM_SRC_ZIP) $(JAMVM_SRC_ZIP).old ; \
	    fi ; \
	    $(WGET) $(JAMVM_URL) -O $(JAMVM_SRC_ZIP); \
	    if ! echo "$(JAMVM_SHA256SUM)  $(JAMVM_SRC_ZIP)" \
	      | $(SHA256SUM) --check ; then \
	      echo "ERROR: Bad download of JamVM zip"; false; \
	    fi; \
	  else \
	    echo "ERROR: No up-to-date JamVM zip available"; exit -1; \
	  fi ; \
	fi
endif
	mkdir -p stamps
	touch $@

clean-download-jamvm:
	rm -f $(JAMVM_SRC_ZIP)
	rm -f stamps/download-jamvm.stamp

clean-drops: clean-download-jaxp-drop clean-download-jaf-drop \
 clean-download-jaxws-drop
	if [ -e drops ] ; then \
	  rm -f drops/*.old ; \
	  rmdir drops ; \
	fi
	rm -f stamps/download-drops.stamp

stamps/download-openjdk.stamp: stamps/hgforest.stamp
if USE_HG
if WITH_HGREV
	$(HG) fclone -r $(HGREV) $(OPENJDK_HG_URL) openjdk.hg;
else
	$(HG) fclone $(OPENJDK_HG_URL) openjdk.hg;
endif
else
if OPENJDK_SRC_DIR_FOUND
else
if USE_ALT_OPENJDK_SRC_ZIP
	ln -sf $(ALT_OPENJDK_SRC_ZIP) $(OPENJDK_SRC_ZIP)
else
	if ! echo "$(OPENJDK_SHA256SUM)  $(OPENJDK_SRC_ZIP)" \
	  | $(SHA256SUM) --check ; \
	then \
	  if test "x$(enable_downloading)" = "xyes"; then \
	    if [ -e $(OPENJDK_SRC_ZIP) ] ; then \
	      mv $(OPENJDK_SRC_ZIP) $(OPENJDK_SRC_ZIP).old ; \
	    fi ; \
	    $(WGET) $(OPENJDK_URL)$(OPENJDK_SRC_ZIP) -O $(OPENJDK_SRC_ZIP); \
	    if ! echo "$(OPENJDK_SHA256SUM)  $(OPENJDK_SRC_ZIP)" \
	      | $(SHA256SUM) --check ; then \
	      echo "ERROR: Bad download of OpenJDK zip"; false; \
	    fi; \
	  else \
	    echo "ERROR: No up-to-date OpenJDK zip available"; exit -1; \
	  fi ; \
	fi
endif
endif
endif
	mkdir -p stamps
	touch stamps/download-openjdk.stamp

clean-download-openjdk:
	rm -f $(OPENJDK_SRC_ZIP)
	rm -rf openjdk.hg
	rm -f stamps/download-openjdk.stamp

stamps/download-hotspot.stamp:
if WITH_ALT_HSBUILD
if USE_ALT_HOTSPOT_SRC_ZIP
	ln -sf $(ALT_HOTSPOT_SRC_ZIP) $(HOTSPOT_SRC_ZIP)
endif
	hotspot_sha256sum="`$(AWK) 'version==$$1 {print $$4}' version=$(HSBUILD) \
	  $(abs_top_srcdir)/hotspot.map`" ; \
	if ! echo "$${hotspot_sha256sum}  $(HOTSPOT_SRC_ZIP)" \
	  | $(SHA256SUM) --check ; \
	then \
	  if test "x$(enable_downloading)" = "xyes"; then \
	    if [ -e $(HOTSPOT_SRC_ZIP) ] ; then \
	      mv $(HOTSPOT_SRC_ZIP) $(HOTSPOT_SRC_ZIP).old ; \
	    fi ; \
	    hotspot_url="`$(AWK) 'version==$$1 {print $$2 "/archive/" $$3 ".tar.gz"}' \
	      version=$(HSBUILD) $(abs_top_srcdir)/hotspot.map`"; \
	    $(WGET) $${hotspot_url} -O $(HOTSPOT_SRC_ZIP) ; \
	    if ! echo "$${hotspot_sha256sum}  $(HOTSPOT_SRC_ZIP)" \
	      | $(SHA256SUM) --check ; then \
	      echo "ERROR: Bad download of HotSpot zip"; false; \
	    fi; \
	  else \
	    echo "ERROR: No up-to-date HotSpot zip available"; exit -1; \
	  fi ; \
	fi
endif
	mkdir -p stamps
	touch stamps/download-hotspot.stamp

clean-download-hotspot:
	rm -f $(HOTSPOT_SRC_ZIP)
	rm -f stamps/download-hotspot.stamp

stamps/download.stamp: stamps/download-drops.stamp stamps/download-cacao.stamp \
 stamps/download-jamvm.stamp stamps/download-openjdk.stamp stamps/download-hotspot.stamp
	touch stamps/download.stamp

clean-download: clean-drops clean-download-cacao clean-download-jamvm \
 clean-download-openjdk clean-download-hotspot
	rm -f stamps/download.stamp

stamps/extract.stamp: stamps/extract-openjdk.stamp \
 stamps/extract-cacao.stamp stamps/extract-jamvm.stamp
	mkdir -p stamps
	touch $@

clean-extract: clean-extract-openjdk clean-cacao clean-jamvm
	rm -f stamps/extract.stamp

stamps/extract-openjdk.stamp: stamps/download.stamp
if OPENJDK_SRC_DIR_FOUND
	if ! test -d openjdk ; then \
	  cp -pPR $(OPENJDK_SRC_DIR_LINK) $(OPENJDK_SRC_DIR) openjdk ; \
	fi
else
if USE_HG
	if ! test -d openjdk ; then \
	  cp -pPRl openjdk.hg openjdk ; \
	fi
else
	set -e ; \
	if ! test -d openjdk ; \
	then \
	  mkdir openjdk ; \
	  $(TAR) xf $(OPENJDK_SRC_ZIP) -C openjdk; \
	  chmod -R ug+w openjdk ; \
	  sh $(abs_top_srcdir)/fsg.sh ; \
	fi
endif
endif
if ENABLE_CACAO
	mkdir -p openjdk/jdk/src/solaris/bin/$(JRE_ARCH_DIR)
	cp jvm.cacao.cfg openjdk/jdk/src/solaris/bin/$(JRE_ARCH_DIR)/jvm.cfg
endif
if ENABLE_JAMVM
	mkdir -p openjdk/jdk/src/solaris/bin/$(JRE_ARCH_DIR)
	cp jvm.jamvm.cfg openjdk/jdk/src/solaris/bin/$(JRE_ARCH_DIR)/jvm.cfg
endif
	mkdir -p stamps
	touch stamps/extract-openjdk.stamp

clean-extract-openjdk:
	rm -rf openjdk
	rm -f stamps/extract-openjdk.stamp
	rm -f stamps/patch-fsg.stamp
	rm -f stamps/patch.stamp

stamps/extract-cacao.stamp: stamps/download-cacao.stamp
if BUILD_CACAO
if !USE_SYSTEM_CACAO
if USE_ALT_CACAO_SRC_DIR
	set -e ; \
	if ! test -d cacao/cacao ; \
	then \
	  mkdir cacao ; \
	  cp -rL $(ALT_CACAO_SRC_DIR) cacao/cacao ; \
	fi
else
	set -e ; \
	if ! test -d cacao/cacao ; \
	then \
	  mkdir cacao ; \
	  $(TAR) xf $(CACAO_SRC_ZIP) -C cacao ; \
	  dir=$$(basename cacao/cacao-*) ; \
	  ln -s $$dir cacao/cacao ; \
	fi
endif
endif
endif
	mkdir -p stamps
	touch $@

stamps/extract-jamvm.stamp: stamps/download-jamvm.stamp
if BUILD_JAMVM
	set -e ; \
	if ! test -d jamvm ; \
	then \
	  mkdir jamvm ; \
	  $(TAR) xf $(JAMVM_SRC_ZIP) -C jamvm ; \
	  dir=$$(basename jamvm/jamvm-*) ; \
	  ln -s $$dir jamvm/jamvm ; \
	fi
endif
	mkdir -p stamps
	touch stamps/extract-jamvm.stamp

stamps/replace-hotspot.stamp: stamps/extract.stamp
if WITH_ALT_HSBUILD
	if test "x${HSBUILD}" != "xoriginal"; then \
	  rm -rf openjdk/hotspot ; \
	  if test -e ${HOTSPOT_SRC_ZIP} ; \
	  then \
	    $(TAR) xf $(HOTSPOT_SRC_ZIP) ; \
	    dir=$$($(AWK) 'version==$$1 {print gensub(/.*\/([^/]*)$$/,"\\1","g",$$2)}' \
	      version=$(HSBUILD) $(abs_top_srcdir)/hotspot.map) ; \
	    chmod -R ug+w $$dir-* ; \
	    mv $$dir-$$($(AWK) 'version==$$1 {print $$3}' version=$(HSBUILD) \
	      $(abs_top_srcdir)/hotspot.map) openjdk/hotspot ; \
	  fi ; \
	fi ;
endif
	mkdir -p stamps
	touch stamps/replace-hotspot.stamp

clean-replace-hotspot:
	rm -f stamps/replace-hotspot.stamp

# Copy ports sources into tree
stamps/ports.stamp: stamps/replace-hotspot.stamp
	for target in $(abs_top_srcdir)/arm_port/hotspot/tools \
		      $(abs_top_srcdir)/arm_port/hotspot/src/*cpu/* ; do \
	  link=$$(dirname $$target | sed 's/^.*arm_port/openjdk/'); \
	  cp -rv $(SRC_DIR_LINK) $$target $$link; \
	  chmod -R ug+rwX $$link; \
	done
	mkdir -p stamps
	touch stamps/ports.stamp

clean-ports:
	for target in $(abs_top_srcdir)/arm_port/hotspot/tools \
		      $(abs_top_srcdir)/arm_port/hotspot/src/*cpu/* ; do \
	  link=$$(dirname $$target | sed 's/^.*arm_port/openjdk/'); \
	  rm -rf $$link; \
	done
	rm -f stamps/ports.stamp

stamps/generated.stamp: stamps/ports.stamp
	if [ ! -e $(GENERATED_BUILD_DIR) ]; then \
	  cp -a $(abs_top_srcdir)/generated $(GENERATED_BUILD_DIR) && \
	  chmod -R ug+rwX $(GENERATED_BUILD_DIR) ; \
	fi
	mkdir -p stamps
	touch stamps/generated.stamp

clean-generated:
	if [ $(abs_top_srcdir) != $(abs_top_builddir) ]; then \
	  rm -rf $(GENERATED_BUILD_DIR); \
	fi
	rm -f stamps/generated.stamp

stamps/fonts.stamp: stamps/generated.stamp
	cp $(FONTCONFIG_PATH)/linux.fontconfig.Fedora.properties $(FONTCONFIG_PATH)/linux.fontconfig.Fedora.9.properties
	cp $(FONTCONFIG_PATH)/linux.fontconfig.Fedora.properties $(FONTCONFIG_PATH)/linux.fontconfig.Fedora.10.properties
	cp $(FONTCONFIG_PATH)/linux.fontconfig.Fedora.properties $(FONTCONFIG_PATH)/linux.fontconfig.Fedora.11.properties
	cp $(FONTCONFIG_PATH)/linux.fontconfig.Fedora.properties $(FONTCONFIG_PATH)/linux.fontconfig.Fedora.12.properties
	mkdir -p stamps
	touch stamps/fonts.stamp

clean-fonts:
	rm -f stamps/fonts.stamp

stamps/patch-fsg.stamp: stamps/fonts.stamp
	mkdir -p stamps ; \
	rm -f stamps/patch-fsg.stamp.tmp ; \
	touch stamps/patch-fsg.stamp.tmp ; \
	all_patches_ok=yes; \
	for p in $(ICEDTEA_FSG_PATCHES) ; \
	do \
	  if test x$${all_patches_ok} = "xyes" \
	    && echo Checking $$p \
	    && $(PATCH) -l -p0 --dry-run -s -t -f \
	      < $(abs_top_srcdir)/$$p ; \
	  then \
	    echo Applying $$p ; \
	    $(PATCH) -l -p0 < $(abs_top_srcdir)/$$p ; \
	    if ! grep "^\* $$(basename $$p)" $(abs_top_srcdir)/HACKING \
	      >> stamps/patch-fsg.stamp.tmp ; \
	    then \
	      echo "* $$(basename $$p): UNDOCUMENTED" \
	        >> stamps/patch-fsg.stamp.tmp ; \
	    fi ; \
	  else \
	    test x$${all_patches_ok} = "xyes" && all_patches_ok=$$p ; \
	  fi ; \
	done ; \
	mv stamps/patch-fsg.stamp.tmp stamps/patch-fsg.stamp ; \
	if ! test x$${all_patches_ok} = "xyes"; then \
	  echo ERROR patch $${all_patches_ok} FAILED! ; \
	  echo WARNING make clean-patch before retrying a fix ; \
	  exit 2; \
	fi ; 

clean-patch-fsg: clean-patch
	rm -f stamps/patch-fsg.stamp
	all_patches_ok=yes; \
	for p in $(ICEDTEA_FSG_PATCHES) ; \
	do \
	  echo Checking $$p ; \
	  if $(PATCH) -l -p0 -R --dry-run -s -t -f < $(abs_top_srcdir)/$$p ; \
	  then \
	    echo Reverting $$p ; \
	    $(PATCH) -l -p0 -R < $(abs_top_srcdir)/$$p ; \
	  else \
	    all_patches_ok=no ; \
	  fi ; \
	done ; \
	if ! test x$${all_patches_ok} = "xyes" ; then \
	  echo "WARNING Not all patches reverted cleanly" ; \
	fi

stamps/patch.stamp: stamps/patch-fsg.stamp
	mkdir -p stamps ; \
	rm -f stamps/patch.stamp.tmp ; \
	touch stamps/patch.stamp.tmp ; \
	all_patches_ok=yes; \
	for p in $(ICEDTEA_PATCHES) ; \
	do \
	  if test x$${all_patches_ok} = "xyes" \
	    && echo Checking $$p \
	    && $(PATCH) -l -p0 --dry-run -s -t -f \
	      < $(abs_top_srcdir)/$$p ; \
	  then \
	    echo Applying $$p ; \
	    $(PATCH) -l -p0 < $(abs_top_srcdir)/$$p ; \
	    if ! grep "^\* $$(basename $$p)" $(abs_top_srcdir)/HACKING \
	      >> stamps/patch.stamp.tmp ; \
	    then \
	      echo "* $$(basename $$p): UNDOCUMENTED" \
	        >> stamps/patch.stamp.tmp ; \
	    fi ; \
	  else \
	    test x$${all_patches_ok} = "xyes" && all_patches_ok=$$p ; \
	  fi ; \
	done ; \
	mv stamps/patch.stamp.tmp stamps/patch.stamp ; \
	if ! test x$${all_patches_ok} = "xyes"; then \
	  echo ERROR patch $${all_patches_ok} FAILED! ; \
	  echo WARNING make clean-patch before retrying a fix ; \
	  exit 2; \
	fi

	icedtea_version="$(PACKAGE_VERSION)$(ICEDTEA_REV)" ; \
	if test "x$(ENABLE_CACAO)" = "xyes" || \
	   test "x$(ENABLE_JAMVM)" = "xyes"; then \
	  echo "JDK_DERIVATIVE_NAME=$${icedtea_version}" \
	    >>openjdk/jdk/make/common/shared/Defs.gmk ; \
	  echo "PRODUCT_NAME=$(ICEDTEA_NAME)" \
	    >>openjdk/jdk/make/common/shared/Defs.gmk ; \
	else \
	  echo "JDK_DERIVATIVE_NAME=$(ICEDTEA_NAME) $${icedtea_version}" \
	    >>openjdk/jdk/make/common/shared/Defs.gmk ; \
	fi ; 

if HAS_JDK_REVISION
	echo "JDK_REVID=$(JDK_REVISION)" >>openjdk/jdk/make/common/shared/Defs.gmk ;
endif

	echo "DISTRO_NAME=$(DIST_NAME)" >>openjdk/jdk/make/common/shared/Defs.gmk ;
if HAS_PKGVERSION
	  echo "DISTRO_PACKAGE_VERSION=$(PKGVERSION)" \
	    >>openjdk/jdk/make/common/shared/Defs.gmk ;
endif

clean-patch:
	rm -f stamps/patch.stamp
	all_patches_ok=yes; \
	for p in $(ICEDTEA_PATCHES) ; \
	do \
	  echo Checking $$p ; \
	  if $(PATCH) -l -p0 -R --dry-run -s -t -f < $(abs_top_srcdir)/$$p ; \
	  then \
	    echo Reverting $$p ; \
	    $(PATCH) -l -p0 -R < $(abs_top_srcdir)/$$p ; \
	  else \
	    all_patches_ok=no ; \
	  fi ; \
	done ; \
	if ! test x$${all_patches_ok} = "xyes" ; then \
	  echo "WARNING Not all patches reverted cleanly" ; \
	fi

#FIXME (missing): versioning.stamp
#FIXME (clean): Missing clean-versioning

stamps/overlay.stamp: stamps/patch.stamp
	cp -a $(abs_top_srcdir)/overlays overlays.build
	chmod -R ug+rwX overlays.build
	cp -a overlays.build/openjdk/* openjdk/
	cp -a overlays.build/jpeg/openjdk/* openjdk/
	rm -rf overlays.build
	touch stamps/overlay.stamp

clean-overlay:
	rm -f stamps/overlay.stamp

# OpenJDK ecj Source Preparation Targets
# ======================================

# Copy over OpenJDK sources for ecj.
# FIXME (missing): Rename to clone-ecj.
stamps/extract-ecj.stamp: $(OPENJDK_TREE)
	if ! test -d openjdk-ecj ; then \
	    cp -pPRl openjdk openjdk-ecj ; \
	fi
	mkdir -p stamps
	touch stamps/extract-ecj.stamp

# FIXME (missing): Rename to clean-clone-ecj.
clean-extract-ecj:
	rm -rf openjdk-ecj
	rm -f stamps/extract-ecj.stamp
	rm -f stamps/patch-ecj.stamp

# Patch OpenJDK for ecj.

stamps/patch-ecj.stamp: stamps/extract-ecj.stamp
	mkdir -p stamps; \
	rm -f stamps/patch-ecj.stamp.tmp ; \
	touch stamps/patch-ecj.stamp.tmp ; \
	all_patches_ok=yes; \
	for p in $(ICEDTEA_ECJ_PATCHES) ; \
	do \
	  if test x$${all_patches_ok} = "xyes" \
	    && echo Checking $$p \
	    && $(PATCH) -l -p0 --dry-run -s -t -f \
	      < $(abs_top_srcdir)/$$p ; \
	  then \
	    echo Applying $$p ; \
	    $(PATCH) -l -p0 < $(abs_top_srcdir)/$$p ; \
	    if ! grep "^\* $$(basename $$p)" $(abs_top_srcdir)/HACKING \
	      >> stamps/patch-ecj.stamp.tmp ; \
	    then \
	      echo "* $$(basename $$p): UNDOCUMENTED" \
	        >> stamps/patch-ecj.stamp.tmp ; \
	    fi ; \
	  else \
	    test x$${all_patches_ok} = "xyes" && all_patches_ok=$$p ; \
	  fi ; \
	done ; \
	mv stamps/patch-ecj.stamp.tmp stamps/patch-ecj.stamp ; \
	if ! test x$${all_patches_ok} = "xyes"; then \
	  echo ERROR patch $${all_patches_ok} FAILED! ; \
	  echo WARNING make clean-patch before retrying a fix ; \
	  exit 2; \
	fi

clean-patch-ecj:
	rm -f stamps/patch-ecj.stamp
	all_patches_ok=yes; \
	for p in $(ICEDTEA_ECJ_PATCHES) ; \
	do \
	  echo Checking $$p ; \
	  if $(PATCH) -l -p0 -R --dry-run -s -t -f < $(abs_top_srcdir)/$$p ; \
	  then \
	    echo Reverting $$p ; \
	    $(PATCH) -l -p0 -R < $(abs_top_srcdir)/$$p ; \
	  else \
	    all_patches_ok=no ; \
	  fi ; \
	done ; \
	if ! test x$${all_patches_ok} = "xyes" ; then \
	  echo "WARNING Not all patches reverted cleanly" ; \
	fi

# Bootstrap Directory Targets
# ===========================

stamps/native-ecj.stamp: 
	mkdir -p stamps ; \
	if test "x$(GCJ)" != "xno"; then \
	  $(GCJ) $(IT_CFLAGS) -Wl,-Bsymbolic -findirect-dispatch -o native-ecj \
	    --main=org.eclipse.jdt.internal.compiler.batch.Main ${ECJ_JAR} ; \
	fi ; \
	touch stamps/native-ecj.stamp

clean-native-ecj:
	rm -f native-ecj
	rm -f stamps/native-ecj.stamp

# bootstrap/ecj.
stamps/bootstrap-directory-ecj.stamp: stamps/native-ecj.stamp
	mkdir -p $(ECJ_BOOT_DIR)/bin stamps/
	ln -sf $(JAVA) $(ECJ_BOOT_DIR)/bin/java
	ln -sf $(JAVAH) $(ECJ_BOOT_DIR)/bin/javah
	ln -sf $(RMIC) $(ECJ_BOOT_DIR)/bin/rmic
	ln -sf $(JAR) $(ECJ_BOOT_DIR)/bin/jar
	ln -sf $(NATIVE2ASCII) $(ECJ_BOOT_DIR)/bin/native2ascii
	ln -sf $(abs_top_builddir)/javac $(ECJ_BOOT_DIR)/bin/javac
	ln -sf $(abs_top_builddir)/javap $(ECJ_BOOT_DIR)/bin/javap
	mkdir -p $(ECJ_BOOT_DIR)/jre/lib && \
	cp $(SYSTEM_JDK_DIR)/jre/lib/rt.jar $(ECJ_BOOT_DIR)/jre/lib/rt.jar && \
	ln -sf $(SYSTEM_JDK_DIR)/jre/lib/$(JRE_ARCH_DIR) \
	  $(ECJ_BOOT_DIR)/jre/lib/ && \
	if ! test -d $(ECJ_BOOT_DIR)/jre/lib/$(INSTALL_ARCH_DIR); \
	  then \
	  ln -sf ./$(JRE_ARCH_DIR) \
	    $(ECJ_BOOT_DIR)/jre/lib/$(INSTALL_ARCH_DIR); \
	fi;
	mkdir -p $(ECJ_BOOT_DIR)/include && \
	for i in $(SYSTEM_JDK_DIR)/include/*; do \
	  test -r $$i | continue; \
	  i=`basename $$i`; \
	  rm -f $(ECJ_BOOT_DIR)/include/$$i; \
	  ln -s $(SYSTEM_JDK_DIR)/include/$$i $(ECJ_BOOT_DIR)/include/$$i; \
	done
# For HotSpot
	mkdir -p $(ECJ_BOOT_DIR)/lib && \
	ln -sf $(ECJ_BOOT_DIR)/jre/lib/rt.jar $(ECJ_BOOT_DIR)/lib/tools.jar
	mkdir -p stamps
	touch stamps/bootstrap-directory-ecj.stamp

clean-bootstrap-directory-ecj:
	rm -rf $(ECJ_BOOT_DIR)
	rm -f stamps/bootstrap-directory-ecj.stamp

# bootstrap/icedtea.
stamps/bootstrap-directory.stamp: stamps/icedtea-against-ecj.stamp
	rm -f $(ICEDTEA_BOOT_DIR)
	ln -s \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/ $(ICEDTEA_BOOT_DIR)
	if ! test -d $(ICEDTEA_BOOT_DIR)/include; then \
	  ln -sf $(ECJ_BUILD_OUTPUT_DIR)/include $(ICEDTEA_BOOT_DIR)/include; \
	fi
	mkdir -p stamps
	touch stamps/bootstrap-directory.stamp

clean-bootstrap-directory:
	rm -rf $(ICEDTEA_BOOT_DIR)
	rm -f stamps/bootstrap-directory.stamp

# bootstrap/jdk1.6.0 to bootstrap/ecj symlink.
stamps/bootstrap-directory-symlink-ecj.stamp: stamps/bootstrap-directory-ecj.stamp
	rm -f $(BOOT_DIR)
	ln -sf $(ECJ_BOOT_DIR) $(BOOT_DIR)
	mkdir -p stamps
	touch stamps/bootstrap-directory-symlink-ecj.stamp

clean-bootstrap-directory-symlink-ecj:
	rm -f $(BOOT_DIR)
	rm -f stamps/bootstrap-directory-symlink-ecj.stamp

# bootstrap/jdk1.6.0 to bootstrap/icedtea symlink.
stamps/bootstrap-directory-symlink.stamp: $(BOOTSTRAP_DIRECTORY_STAMP)
	mkdir -p bootstrap
	rm -f $(BOOT_DIR)
	ln -sf $(ICEDTEA_HOME) $(BOOT_DIR); \
	if ! $(BOOT_DIR)/bin/java -version ; \
         then \
           echo "$(BOOT_DIR)/bin/java" \
               "cannot be found or is corrupted." ; \
           exit 1; \
        fi
	mkdir -p stamps
	touch stamps/bootstrap-directory-symlink.stamp

clean-bootstrap-directory-symlink:
	rm -f $(BOOT_DIR)
	rm -f stamps/bootstrap-directory-symlink.stamp

# OpenJDK Targets
# ===============

# If you change anything here in the icedtea target, please make sure
# you change it in the icedtea-debug target as well.
stamps/icedtea.stamp: stamps/bootstrap-directory-symlink.stamp \
 $(OPENJDK_TREE) stamps/cacao.stamp stamps/rewrite-rhino.stamp \
 stamps/jamvm.stamp
	$(ARCH_PREFIX) $(MAKE) -j1 \
	  $(ICEDTEA_ENV) \
	  -C openjdk \
	  $(ICEDTEA_BUILD_TARGET)
	mkdir -p $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
	mkdir -p $(BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)
	mkdir -p $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/ext
	mkdir -p $(BUILD_OUTPUT_DIR)/j2re-image/lib/ext
if ZERO_BUILD
	printf -- '-zero ALIASED_TO -server\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
if SHARK_BUILD
	printf -- '-shark ALIASED_TO -server\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
if ENABLE_CACAO
	printf -- '-cacao ALIASED_TO -server\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
if ENABLE_JAMVM
	printf -- '-jamvm ALIASED_TO -server\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
	@echo "IcedTea is served:" $(BUILD_OUTPUT_DIR)
	mkdir -p stamps
	touch stamps/icedtea.stamp

clean-icedtea:
	rm -rf $(BUILD_OUTPUT_DIR)
	rm -f stamps/icedtea.stamp

stamps/icedtea-debug.stamp: stamps/bootstrap-directory-symlink.stamp \
 $(OPENJDK_TREE) stamps/cacao.stamp stamps/rewrite-rhino.stamp \
 stamps/jamvm.stamp
	$(ARCH_PREFIX) $(MAKE) -j1 \
	  $(ICEDTEA_ENV) \
	  -C openjdk \
	  $(ICEDTEA_DEBUG_BUILD_TARGET)
	mkdir -p $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
	mkdir -p $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)
	mkdir -p $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/ext
	mkdir -p $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/ext
if ZERO_BUILD
	printf -- '-zero ALIASED_TO -server\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
if SHARK_BUILD
	printf -- '-shark ALIASED_TO -server\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
if ENABLE_CACAO
	printf -- '-cacao ALIASED_TO -server\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
if ENABLE_JAMVM
	printf -- '-jamvm ALIASED_TO -server\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
	@echo "IcedTea (debug build) is served:" \
	  $(DEBUG_BUILD_OUTPUT_DIR)
	mkdir -p stamps
	touch stamps/icedtea-debug.stamp

clean-icedtea-debug:
	rm -rf $(DEBUG_BUILD_OUTPUT_DIR)
	rm -f stamps/icedtea-debug.stamp

stamps/icedtea-against-icedtea.stamp: stamps/icedtea.stamp \
 stamps/add-jamvm.stamp stamps/add-cacao.stamp stamps/add-zero.stamp \
 stamps/add-systemtap.stamp stamps/add-pulseaudio.stamp stamps/add-nss.stamp \
 stamps/add-tzdata-support.stamp stamps/add-archive.stamp stamps/pax-mark-vm.stamp
	mkdir -p stamps
	touch stamps/icedtea-against-icedtea.stamp

clean-icedtea-against-icedtea: clean-add-jamvm clean-add-zero clean-add-cacao \
 clean-add-systemtap clean-add-pulseaudio clean-add-nss clean-add-tzdata-support \
 clean-add-archive clean-pax-mark-vm
	rm -f stamps/icedtea-against-icedtea.stamp

stamps/icedtea-debug-against-icedtea.stamp: stamps/icedtea-debug.stamp \
 stamps/add-jamvm-debug.stamp stamps/add-cacao-debug.stamp \
 stamps/add-zero-debug.stamp stamps/add-systemtap-debug.stamp stamps/add-pulseaudio-debug.stamp \
 stamps/add-nss-debug.stamp stamps/add-tzdata-support-debug.stamp stamps/add-archive-debug.stamp \
 stamps/pax-mark-vm-debug.stamp
	mkdir -p stamps
	touch stamps/icedtea-debug-against-icedtea.stamp

clean-icedtea-debug-against-icedtea: clean-add-zero-debug \
 clean-add-jamvm-debug clean-add-cacao-debug clean-add-systemtap-debug \
 clean-add-pulseaudio-debug clean-add-nss-debug clean-add-tzdata-support-debug \
 clean-add-archive-debug clean-pax-mark-vm-debug
	rm -f stamps/icedtea-debug-against-icedtea.stamp

stamps/add-systemtap.stamp: stamps/icedtea.stamp
if ENABLE_SYSTEMTAP
	mkdir -p $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset
	grep "client IGNORE" $(BUILD_JRE_ARCH_DIR)/jvm.cfg; \
	if test $$? -eq 0; then \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot.stp \
	    > $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot.stp; \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot_gc.stp \
	    > $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_gc.stp; \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot_jni.stp \
	    > $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_jni.stp; \
	else \
	  cp $(abs_top_builddir)/tapset/hotspot.stp \
	    $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot.stp; \
	  cp $(abs_top_builddir)/tapset/hotspot_jni.stp \
	    $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_jni.stp; \
	fi
	cp $(abs_top_builddir)/tapset/jstack.stp \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/jstack.stp
endif
	touch stamps/add-systemtap.stamp

clean-add-systemtap:
	rm -rf $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset
	rm -f stamps/add-systemtap.stamp

stamps/add-systemtap-debug.stamp: stamps/icedtea-debug.stamp
if ENABLE_SYSTEMTAP
	mkdir -p $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/tapset
	grep "client IGNORE" $(BUILD_JRE_ARCH_DIR)/jvm.cfg; \
	if test $$? -eq 0; then \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot.stp \
	    > $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot.stp; \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot_jni.stp \
	    > $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_jni.stp; \
	else \
	  cp $(abs_top_builddir)/tapset/hotspot.stp \
	    $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot.stp; \
	  cp $(abs_top_builddir)/tapset/hotspot_gc.stp \
	    $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_gc.stp; \
	  cp $(abs_top_builddir)/tapset/hotspot_jni.stp \
	    $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_jni.stp; \
	fi
	cp $(abs_top_builddir)/tapset/jstack.stp \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/jstack.stp
endif
	touch stamps/add-systemtap-debug.stamp

clean-add-systemtap-debug:
	rm -rf $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/tapset
	rm -f stamps/add-systemtap-debug.stamp

stamps/add-pulseaudio.stamp: stamps/icedtea.stamp $(PULSE_JAVA_TARGET)
if ENABLE_PULSE_JAVA
	cp -pPRf $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
	cp -pPRf $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so \
	  $(BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)
	cp -pPRf $(PULSE_JAVA_BUILDDIR)/pulse-java.jar \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/ext
	cp -pPRf $(PULSE_JAVA_BUILDDIR)/pulse-java.jar \
	  $(BUILD_OUTPUT_DIR)/j2re-image/lib/ext
	(cd $(PULSE_JAVA_JAVA_SRCDIR) && \
	   $(ZIP) -qur $(BUILD_OUTPUT_DIR)/j2sdk-image/src.zip org )
endif
	touch stamps/add-pulseaudio.stamp

# Note: for simplicity, we don't revert the update of src.zip
clean-add-pulseaudio:
	rm -f $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/libpulse-java.so
	rm -f $(BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)/libpulse-java.so
	rm -f $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/ext/pulse-java.jar
	rm -f $(BUILD_OUTPUT_DIR)/j2re-image/lib/ext/pulse-java.jar
	rm -f stamps/add-pulseaudio.stamp

stamps/add-pulseaudio-debug.stamp: stamps/icedtea-debug.stamp $(PULSE_JAVA_TARGET)
if ENABLE_PULSE_JAVA
	cp -pPRf $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/
	cp -pPRf $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)/
	cp -pPRf $(PULSE_JAVA_BUILDDIR)/pulse-java.jar \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/ext
	cp -pPRf $(PULSE_JAVA_BUILDDIR)/pulse-java.jar \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/ext
	(cd $(PULSE_JAVA_JAVA_SRCDIR) && \
	   $(ZIP) -qur $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/src.zip org )
endif
	touch stamps/add-pulseaudio-debug.stamp

# Note: for simplicity, we don't revert the update of src.zip
clean-add-pulseaudio-debug:
	rm -f $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/libpulse-java.so
	rm -f $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)/libpulse-java.so
	rm -f $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/ext/pulse-java.jar
	rm -f $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/ext/pulse-java.jar
	rm -f stamps/add-pulseaudio-debug.stamp

stamps/add-nss.stamp: stamps/icedtea.stamp
	if [ -d $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security ] ; then \
	  cp -v $(abs_top_builddir)/nss.cfg \
	    $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security; \
	  cp -v $(abs_top_builddir)/nss.cfg \
	    $(BUILD_OUTPUT_DIR)/j2re-image/lib/security; \
	  rm -f stamps/add-nss.stamp.tmp; \
	  touch stamps/add-nss.stamp.tmp; \
	  all_patches_ok=yes; \
	  for dir in $(BUILD_OUTPUT_DIR)/{j2sdk-image/jre,j2re-image} ; \
	  do \
	    pushd $$dir ; \
	    cp -v $$dir/lib/security/java.security{,.old} ; \
	    for p in $(NSS_PATCHES) ; \
	    do \
	      if test x$${all_patches_ok} = "xyes" \
	        && echo Checking $$p \
	        && $(PATCH) -l -p0 --dry-run -s -t -f -F0 \
	          < $(abs_top_srcdir)/$$p ; \
	      then \
	        echo Applying $$p ; \
	        $(PATCH) -l -p0 -F0 < $(abs_top_srcdir)/$$p ; \
	        if ! grep "^\* $$(basename $$p)" $(abs_top_srcdir)/HACKING \
	          >> $(abs_top_builddir)/stamps/add-nss.stamp.tmp ; \
	        then \
	          echo "* $$(basename $$p): UNDOCUMENTED" \
	            >> $(abs_top_builddir)/stamps/add-nss.stamp.tmp ; \
	        fi ; \
	      else \
	        test x$${all_patches_ok} = "xyes" && all_patches_ok=$$p ; \
	      fi ; \
	    done ; \
	    popd ; \
	  done ; \
	  mv stamps/add-nss.stamp.tmp stamps/add-nss.stamp ; \
	  if ! test x$${all_patches_ok} = "xyes"; then \
	    echo ERROR patch $${all_patches_ok} FAILED! ; \
	    echo WARNING make clean-add-nss before retrying a fix ; \
	    exit 2; \
	  fi \
	else \
	  echo "NO $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security dir"; \
	fi

clean-add-nss:
	rm -vf $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security/nss.cfg
	rm -vf $(BUILD_OUTPUT_DIR)/j2re-image/lib/security/nss.cfg
	if [ -e $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security/java.security.old ] ; then \
	  mv -vf $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security/java.security{.old,} ; \
	fi
	if [ -e $(BUILD_OUTPUT_DIR)/j2re-image/lib/security/java.security.old ] ; then \
	  mv -vf $(BUILD_OUTPUT_DIR)/j2re-image/lib/security/java.security{.old,} ; \
	fi
	rm -f stamps/add-nss.stamp

stamps/add-nss-debug.stamp: stamps/icedtea-debug.stamp
	cp $(abs_top_builddir)/nss.cfg \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security;
	cp $(abs_top_builddir)/nss.cfg \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/security;
	rm -f stamps/add-nss-debug.stamp.tmp
	touch stamps/add-nss-debug.stamp.tmp
	all_patches_ok=yes; \
	for dir in $(ECJ_BUILD_OUTPUT_DIR)/{j2sdk-image/jre,j2re-image} ; \
	do \
	  pushd $$dir ; \
	  cp -v $$dir/lib/security/java.security{,.old} ; \
	  for p in $(NSS_PATCHES) ; \
	  do \
	    if test x$${all_patches_ok} = "xyes" \
	      && echo Checking $$p \
	      && $(PATCH) -l -p0 --dry-run -s -t -f -F0 \
	        < $(abs_top_srcdir)/$$p ; \
	    then \
	      echo Applying $$p ; \
	      $(PATCH) -l -p0 -F0 < $(abs_top_srcdir)/$$p ; \
	      if ! grep "^\* $$(basename $$p)" $(abs_top_srcdir)/HACKING \
	        >> $(abs_top_builddir)/stamps/add-nss-debug.stamp.tmp ; \
	      then \
	        echo "* $$(basename $$p): UNDOCUMENTED" \
	          >> $(abs_top_builddir)/stamps/add-nss-debug.stamp.tmp ; \
	      fi ; \
	    else \
	      test x$${all_patches_ok} = "xyes" && all_patches_ok=$$p ; \
	    fi ; \
	  done ; \
	  popd ; \
	done ; \
	mv stamps/add-nss-debug.stamp.tmp stamps/add-nss-debug.stamp ; \
	if ! test x$${all_patches_ok} = "xyes"; then \
	  echo ERROR patch $${all_patches_ok} FAILED! ; \
	  echo WARNING make clean-add-nss-debug before retrying a fix ; \
	  exit 2; \
	fi

clean-add-nss-debug:
	rm -vf $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security/nss.cfg
	rm -vf $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/security/nss.cfg
	if [ -e $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security/java.security.old ] ; then \
	  mv -vf $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security/java.security{.old,} ; \
	fi
	if [ -e $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/security/java.security.old ] ; then \
	  mv -vf $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/security/java.security{.old,} ; \
	fi
	rm -f stamps/add-nss-debug.stamp

stamps/add-tzdata-support.stamp: stamps/icedtea.stamp
if WITH_TZDATA_DIR
	if [ -e $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib ] ; then \
	  cp -v $(abs_top_builddir)/tz.properties \
	    $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib ; \
	fi
endif
	touch stamps/add-tzdata-support.stamp

clean-add-tzdata-support:
	if [ -e $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/tz.properties ] ; then \
	  rm -vf $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/tz.properties ; \
	fi
	rm -f stamps/add-tzdata-support.stamp

stamps/add-tzdata-support-debug.stamp: stamps/icedtea-debug.stamp
if WITH_TZDATA_DIR
	if [ -e $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib ] ; then \
	  cp -v $(abs_top_builddir)/tz.properties \
	    $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib; \
	fi
endif
	touch stamps/add-tzdata-support-debug.stamp

clean-add-tzdata-support-debug:
	if [ -e $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/tz.properties ] ; then \
	  rm -vf $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/tz.properties ; \
	fi
	rm -f stamps/add-tzdata-support-debug.stamp

stamps/add-archive.stamp: stamps/icedtea.stamp
if !ENABLE_JAMVM
if !ENABLE_CACAO
if !ZERO_BUILD
	if [ -e $(BUILD_OUTPUT_DIR)/j2sdk-image/bin/java ] ; then \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/bin/java -Xshare:dump ; \
	fi
endif
endif
endif
	touch stamps/add-archive.stamp

clean-add-archive:
	rm -vf $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/*/*.jsa
	rm -f stamps/add-archive.stamp

stamps/add-archive-debug.stamp: stamps/icedtea-debug.stamp
if !ENABLE_JAMVM
if !ENABLE_CACAO
if !ZERO_BUILD
	if [ -e $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/bin/java ] ; then \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/bin/java -Xshare:dump ; \
	fi
endif
endif
endif
	touch stamps/add-archive-debug.stamp

clean-add-archive-debug:
	rm -vf $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/*/*.jsa
	rm -f stamps/add-archive-debug.stamp

stamps/pax-mark-vm.stamp: stamps/icedtea.stamp
if WITH_PAX
	$(abs_top_builddir)/pax-mark-vm $(BUILD_OUTPUT_DIR)/j2sdk-image
endif
	touch $@

clean-pax-mark-vm:
	rm -f stamps/pax-mark-vm.stamp

stamps/pax-mark-vm-debug.stamp: stamps/icedtea-debug.stamp
if WITH_PAX
	$(abs_top_builddir)/pax-mark-vm $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image
endif
	touch $@

clean-pax-mark-vm-debug:
	rm -f stamps/pax-mark-vm-debug.stamp

# OpenJDK ecj Targets
# ===================

stamps/icedtea-ecj.stamp: stamps/bootstrap-directory-symlink-ecj.stamp \
 $(OPENJDK_ECJ_TREE) stamps/jamvm.stamp stamps/cacao.stamp \
 stamps/rewrite-rhino.stamp
	$(ARCH_PREFIX) $(MAKE) -j1 \
	  $(ICEDTEA_ENV_ECJ) \
	  -C openjdk-ecj/ \
	  $(ICEDTEA_BUILD_TARGET)
	@echo "ecj-poured IcedTea is served:" \
	  $(ECJ_BUILD_OUTPUT_DIR)
	mkdir -p stamps
	touch stamps/icedtea-ecj.stamp

clean-icedtea-ecj:
	rm -rf $(ECJ_BUILD_OUTPUT_DIR)
	rm -f stamps/icedtea-ecj.stamp

stamps/icedtea-against-ecj.stamp: stamps/icedtea-ecj.stamp stamps/add-systemtap-ecj.stamp \
 stamps/add-pulseaudio-ecj.stamp stamps/add-nss-ecj.stamp stamps/add-tzdata-support-ecj.stamp \
 stamps/add-archive-ecj.stamp stamps/pax-mark-vm-ecj.stamp
	mkdir -p stamps
	touch stamps/icedtea-against-ecj.stamp

clean-icedtea-against-ecj: clean-add-systemtap-ecj clean-add-pulseaudio-ecj clean-add-nss-ecj \
 clean-add-tzdata-support-ecj clean-add-archive-ecj clean-pax-mark-vm-ecj
	rm -f stamps/icedtea-against-ecj.stamp

stamps/add-systemtap-ecj.stamp: stamps/icedtea-ecj.stamp
if ENABLE_SYSTEMTAP
	mkdir -p $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/tapset
	grep "client IGNORE" $(BUILD_JRE_ARCH_DIR)/jvm.cfg; \
	if test $$? -eq 0; then \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot.stp \
	    > $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot.stp; \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot_gc.stp \
	    > $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_gc.stp; \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot_jni.stp \
	    > $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_jni.stp; \
	else \
	  cp $(abs_top_builddir)/tapset/hotspot.stp \
	    $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot.stp; \
	  cp $(abs_top_builddir)/tapset/hotspot_gc.stp \
	    $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_gc.stp; \
	  cp $(abs_top_builddir)/tapset/hotspot_jni.stp \
	    $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_jni.stp; \
	fi
	cp $(abs_top_builddir)/tapset/jstack.stp \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/tapset/jstack.stp
endif
	touch stamps/add-systemtap-ecj.stamp

clean-add-systemtap-ecj:
	rm -rf $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/tapset
	rm -f stamps/add-systemtap-ecj.stamp

stamps/add-pulseaudio-ecj.stamp: stamps/icedtea-ecj.stamp $(PULSE_JAVA_TARGET)
if ENABLE_PULSE_JAVA
	cp -pPRf $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
	cp -pPRf $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)
	cp -pPRf $(PULSE_JAVA_BUILDDIR)/pulse-java.jar \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/ext
	cp -pPRf $(PULSE_JAVA_BUILDDIR)/pulse-java.jar \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2re-image/lib/ext
	(cd $(PULSE_JAVA_JAVA_SRCDIR) && \
	   $(ZIP) -qur $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/src.zip org )
endif
	touch stamps/add-pulseaudio-ecj.stamp

# Note: for simplicity, we don't revert the update of src.zip
clean-add-pulseaudio-ecj:
	rm -f $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/libpulse-java.so
	rm -f $(ECJ_BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)/libpulse-java.so
	rm -f $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/ext/pulse-java.jar
	rm -f $(ECJ_BUILD_OUTPUT_DIR)/j2re-image/lib/ext/pulse-java.jar
	rm -f stamps/add-pulseaudio-ecj.stamp

stamps/add-nss-ecj.stamp: stamps/icedtea-ecj.stamp
	cp -v $(abs_top_builddir)/nss.cfg \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security;
	cp -v $(abs_top_builddir)/nss.cfg \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2re-image/lib/security;
	rm -f stamps/add-nss-ecj.stamp.tmp
	touch stamps/add-nss-ecj.stamp.tmp
	all_patches_ok=yes; \
	for dir in $(ECJ_BUILD_OUTPUT_DIR)/{j2sdk-image/jre,j2re-image} ; \
	do \
	  pushd $$dir ; \
	  cp -v $$dir/lib/security/java.security{,.old} ; \
	  for p in $(NSS_PATCHES) ; \
	  do \
	    if test x$${all_patches_ok} = "xyes" \
	      && echo Checking $$p \
	      && $(PATCH) -l -p0 --dry-run -s -t -f -F0 \
	        < $(abs_top_srcdir)/$$p ; \
	    then \
	      echo Applying $$p ; \
	      $(PATCH) -l -p0 -F0 < $(abs_top_srcdir)/$$p ; \
	      if ! grep "^\* $$(basename $$p)" $(abs_top_srcdir)/HACKING \
	        >> $(abs_top_builddir)/stamps/add-nss-ecj.stamp.tmp ; \
	      then \
	        echo "* $$(basename $$p): UNDOCUMENTED" \
	          >> $(abs_top_builddir)/stamps/add-nss-ecj.stamp.tmp ; \
	      fi ; \
	    else \
	      test x$${all_patches_ok} = "xyes" && all_patches_ok=$$p ; \
	    fi ; \
	  done ; \
	  popd ; \
	done ; \
	mv stamps/add-nss-ecj.stamp.tmp stamps/add-nss-ecj.stamp ; \
	if ! test x$${all_patches_ok} = "xyes"; then \
	  echo ERROR patch $${all_patches_ok} FAILED! ; \
	  echo WARNING make clean-add-nss-ecj before retrying a fix ; \
	  exit 2; \
	fi

clean-add-nss-ecj:
	rm -vf $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security/nss.cfg
	rm -vf $(ECJ_BUILD_OUTPUT_DIR)/j2re-image/lib/security/nss.cfg
	if [ -e $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security/java.security.old ] ; then \
	  mv -vf $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security/java.security{.old,} ; \
	fi
	if [ -e $(ECJ_BUILD_OUTPUT_DIR)/j2re-image/lib/security/java.security.old ] ; then \
	  mv -vf $(ECJ_BUILD_OUTPUT_DIR)/j2re-image/lib/security/java.security{.old,} ; \
	fi
	rm -f stamps/add-nss-ecj.stamp

stamps/add-tzdata-support-ecj.stamp: stamps/icedtea-ecj.stamp
if WITH_TZDATA_DIR
	if [ -e $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib ] ; then \
	  cp -v $(abs_top_builddir)/tz.properties \
	    $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib; \
	fi
endif
	touch stamps/add-tzdata-support-ecj.stamp

clean-add-tzdata-support-ecj:
	if [ -e $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/tz.properties ] ; then \
	  rm -vf $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/tz.properties ; \
	fi
	rm -f stamps/add-tzdata-support-ecj.stamp

stamps/add-archive-ecj.stamp: stamps/icedtea-ecj.stamp
if !ENABLE_JAMVM
if !ENABLE_CACAO
if !ZERO_BUILD
	if [ -e $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/bin/java ] ; then \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/bin/java -Xshare:dump ; \
	fi
endif
endif
endif
	touch stamps/add-archive-ecj.stamp

clean-add-archive-ecj:
	rm -vf $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/*/*.jsa
	rm -f stamps/add-archive-ecj.stamp

stamps/pax-mark-vm-ecj.stamp: stamps/icedtea-ecj.stamp
if WITH_PAX
	$(abs_top_builddir)/pax-mark-vm $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image
endif
	touch $@

clean-pax-mark-vm-ecj:
	rm -f stamps/pax-mark-vm-ecj.stamp

# Rebuild targets

rebuild:
if BOOTSTRAPPING
	rm -f stamps/icedtea-ecj.stamp
	rm -f stamps/icedtea-against-ecj.stamp
	$(ARCH_PREFIX) $(MAKE) icedtea-against-ecj
	@echo "ecj-poured IcedTea is served (again):" $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image
else
	rm -f stamps/icedtea.stamp
	rm -f stamps/icedtea-against-icedtea.stamp
	$(ARCH_PREFIX) $(MAKE) icedtea-against-icedtea
	@echo "IcedTea is served (again):" $(BUILD_OUTPUT_DIR)/j2sdk-image
endif

hotspot:
if BOOTSTRAPPING
	rm -f stamps/icedtea-ecj.stamp
	$(ARCH_PREFIX) $(MAKE) ICEDTEA_BUILD_TARGET=hotspot icedtea-ecj
	mkdir -p \
	   $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/server
	cp $(ECJ_BUILD_OUTPUT_DIR)/$(SERVER_DIR)/libjvm.so \
	   $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/server
	@echo "Hotspot is served:" $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image
else
	rm -f stamps/icedtea.stamp
	$(ARCH_PREFIX) $(MAKE) ICEDTEA_BUILD_TARGET=hotspot icedtea
	mkdir -p \
	   $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/server
	cp $(BUILD_OUTPUT_DIR)/$(SERVER_DIR)/libjvm.so \
	   $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/server
	@echo "Hotspot is served:" $(BUILD_OUTPUT_DIR)/j2sdk-image
endif

# PulseAudio based mixer
# (pulse-java)

#FIXME (meta): Need pulse-java meta target

if ENABLE_PULSE_JAVA
$(PULSE_JAVA_NATIVE_BUILDDIR)/%.o: $(PULSE_JAVA_NATIVE_SRCDIR)/%.c stamps/pulse-java-headers.stamp
	$(CC) $(IT_CFLAGS) -fPIC -I$(BOOT_DIR)/include/linux -I$(BOOT_DIR)/include \
	 -I$(PULSE_JAVA_NATIVE_BUILDDIR) -o $@ -c $<

$(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so: $(PULSE_JAVA_NATIVE_OBJECTS)
	$(CC) $(LDFLAGS) -shared $(PULSE_JAVA_NATIVE_OBJECTS) $(LIBPULSE_LIBS) \
	 -o $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so

stamps/pulse-java.stamp: stamps/pulse-java-jar.stamp $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so
	mkdir -p stamps
	touch stamps/pulse-java.stamp

stamps/pulse-java-jar.stamp: stamps/pulse-java-class.stamp
	mkdir -p $(PULSE_JAVA_CLASS_DIR);
	$(BOOT_DIR)/bin/jar cf $(PULSE_JAVA_BUILDDIR)/pulse-java.jar -C $(PULSE_JAVA_CLASS_DIR) .;
	mkdir -p stamps
	touch stamps/pulse-java-jar.stamp

stamps/pulse-java-class.stamp: $(INITIAL_BOOTSTRAP_LINK_STAMP)
	mkdir -p $(PULSE_JAVA_CLASS_DIR)
	(cd $(PULSE_JAVA_JAVA_SRCDIR); \
	 $(BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) -d $(PULSE_JAVA_CLASS_DIR) \
	  -bootclasspath $(RUNTIME) \
	  org/classpath/icedtea/pulseaudio/*.java \
	)
	cp -r $(PULSE_JAVA_JAVA_SRCDIR)/META-INF $(PULSE_JAVA_CLASS_DIR)
	chmod -R ug+w $(PULSE_JAVA_CLASS_DIR)/META-INF
	mkdir -p stamps
	touch stamps/pulse-java-class.stamp

stamps/pulse-java-headers.stamp: stamps/pulse-java-class.stamp
	mkdir -p $(PULSE_JAVA_NATIVE_BUILDDIR)
	$(BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  -J-Xbootclasspath/p:$(PULSE_JAVA_CLASS_DIR) org.classpath.icedtea.pulseaudio.EventLoop ; \
	$(BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  -J-Xbootclasspath/p:$(PULSE_JAVA_CLASS_DIR) org.classpath.icedtea.pulseaudio.Stream ; \
	$(BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  -J-Xbootclasspath/p:$(PULSE_JAVA_CLASS_DIR) org.classpath.icedtea.pulseaudio.Operation; \
	$(BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  -J-Xbootclasspath/p:$(PULSE_JAVA_CLASS_DIR) org.classpath.icedtea.pulseaudio.PulseAudioSourcePort ; \
	$(BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  -J-Xbootclasspath/p:$(PULSE_JAVA_CLASS_DIR) org.classpath.icedtea.pulseaudio.PulseAudioTargetPort ; \
	$(BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  -J-Xbootclasspath/p:$(PULSE_JAVA_CLASS_DIR) org.classpath.icedtea.pulseaudio.ContextEvent; \
	mkdir -p stamps
	touch stamps/pulse-java-headers.stamp

clean-pulse-java:
	rm -rf $(PULSE_JAVA_NATIVE_BUILDDIR)
	rm -rf $(PULSE_JAVA_CLASS_DIR)
	rm -f $(PULSE_JAVA_BUILDDIR)/pulse-java.jar
	if [ -e $(PULSE_JAVA_BUILDDIR) ] ; then \
	  rmdir $(PULSE_JAVA_BUILDDIR) ; \
	fi
	rm -f stamps/pulse-java*.stamp
endif

# end of pulse-java

# Rhino support

stamps/rewriter.stamp: $(INITIAL_BOOTSTRAP_LINK_STAMP)
if WITH_RHINO
	mkdir -p $(REWRITER_BUILD_DIR)
	$(BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) \
	 -d $(REWRITER_BUILD_DIR) $(REWRITER_SRCS)
endif
	mkdir -p stamps
	touch stamps/rewriter.stamp

clean-rewriter:
	rm -rf rewriter.build
	rm -f stamps/rewriter.stamp

stamps/rewrite-rhino.stamp: stamps/rewriter.stamp $(RHINO_JAR)
if WITH_RHINO
	mkdir -p rhino/rhino.{old,new} && \
	(cd rhino/rhino.old ; $(BOOT_DIR)/bin/jar xf $(RHINO_JAR)) && \
	$(BOOT_DIR)/bin/java -cp $(abs_top_builddir)/rewriter.build \
	  com.redhat.rewriter.ClassRewriter \
	  $(abs_top_builddir)/rhino/rhino.old $(abs_top_builddir)/rhino/rhino.new \
	  org.mozilla sun.org.mozilla && \
	(cd rhino/rhino.old ; \
	 for files in `find -type f -not -name '*.class'` ; do \
	   new_file=../rhino.new/`echo $$files|sed -e 's#org#sun/org#'` ; \
	   mkdir -p `dirname $$new_file` ; \
	   cp -v $$files $$new_file ; \
	   sed -ie 's#org\.mozilla#sun.org.mozilla#g' $$new_file ; \
	 done \
	) && \
	(cd rhino/rhino.new && \
	$(BOOT_DIR)/bin/jar cfm ../rhino.jar META-INF/MANIFEST.MF sun )
endif
	mkdir -p stamps
	touch stamps/rewrite-rhino.stamp

clean-rewrite-rhino:
	rm -rf rhino/rhino.old
	rm -rf rhino/rhino.new
	rm -f rhino/rhino.jar
	if [ -e rhino ] ; then \
	  rmdir rhino ; \
	fi
	rm -f stamps/rewrite-rhino.stamp

# JamVM

stamps/jamvm.stamp: $(OPENJDK_TREE) stamps/rt.stamp
if BUILD_JAMVM
	cd jamvm/jamvm && \
	LDFLAGS="-Xlinker -z -Xlinker noexecstack" \
	./autogen.sh --with-java-runtime-library=openjdk6 \
	  --prefix=$(abs_top_builddir)/jamvm/install ; \
	$(MAKE) ; \
	$(MAKE) install
	mkdir -p $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server
	cp $(abs_top_builddir)/jamvm/install/lib/libjvm.so $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server
	ln -sf server $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/client
	touch $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server/Xusage.txt
	ln -sf client/libjvm.so $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/libjsig.so
endif
	mkdir -p stamps
	touch $@

clean-jamvm:
	rm -rf jamvm
	rm -f stamps/jamvm.stamp
	rm -f stamps/extract-jamvm.stamp

# Targets for additional VMs

stamps/add-jamvm.stamp: stamps/icedtea.stamp stamps/jamvm.stamp
if ADD_JAMVM_BUILD
	mkdir -p $(BUILD_JRE_ARCH_DIR)/jamvm
	install -m 644 jamvm/install/lib/libjvm.so \
		$(BUILD_JRE_ARCH_DIR)/jamvm/
	printf -- '-jamvm KNOWN\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
else
	printf -- '-jamvm ERROR\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
	touch $@

clean-add-jamvm:
	rm -rf $(BUILD_JRE_ARCH_DIR)/jamvm
	if [ -e $(BUILD_JRE_ARCH_DIR)/jvm.cfg ] ; then \
	  sed -i 's#-jamvm KNOWN#-jamvm ERROR#' $(BUILD_JRE_ARCH_DIR)/jvm.cfg ; \
	fi
	rm -f stamps/add-jamvm.stamp

stamps/add-jamvm-debug.stamp: stamps/icedtea-debug.stamp stamps/jamvm.stamp
if ADD_JAMVM_BUILD
	mkdir -p $(BUILD_DEBUG_JRE_ARCH_DIR)/jamvm
	install -m 644 jamvm/install/lib/libjvm.so \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/jamvm/
	printf -- '-jamvm KNOWN\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
else
	printf -- '-jamvm ERROR\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
	touch $@

clean-add-jamvm-debug:
	rm -rf $(BUILD_DEBUG_JRE_ARCH_DIR)/jamvm
	if [ -e $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg ] ; then \
	  sed -i 's#-jamvm KNOWN#-jamvm ERROR#' $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg ; \
	fi
	rm -f stamps/add-jamvm-debug.stamp

# CACAO

stamps/cacao.stamp: $(OPENJDK_TREE) stamps/rt.stamp
if BUILD_CACAO
if !USE_SYSTEM_CACAO
	cd cacao/cacao && \
	./autogen.sh && \
	$(ARCH_PREFIX) ./configure \
	  --host=$(host_alias) \
	  --build=$(build_alias) \
	  --target=$(target_alias) \
	  --prefix=$(abs_top_builddir)/cacao/install \
	  --with-java-runtime-library=openjdk \
	  --with-java-runtime-library-prefix=$(abs_top_builddir)/openjdk \
	  --with-java-runtime-library-classes=$(RUNTIME) \
	  --enable-jre-layout $(CACAO_CONFIGURE_ARGS); \
	$(ARCH_PREFIX) $(MAKE) -j$(PARALLEL_JOBS) install
	ln -s server $(abs_top_builddir)/cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/client
	touch $(abs_top_builddir)/cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/server/Xusage.txt
	ln -sf client/libjvm.so $(abs_top_builddir)/cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/libjsig.so
endif
endif
	mkdir -p stamps
	touch $@

clean-cacao:
	rm -rf cacao
	rm -f stamps/cacao.stamp
	rm -f stamps/extract-cacao.stamp

# targets for additional VMs

stamps/add-cacao.stamp: stamps/icedtea.stamp stamps/cacao.stamp
if ADD_CACAO_BUILD
	mkdir -p $(BUILD_JRE_ARCH_DIR)/cacao
	install -m 644 cacao/install/lib/libjvm.so \
		$(BUILD_JRE_ARCH_DIR)/cacao/
	install -m 644 cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/libjsig.so \
		$(BUILD_JRE_ARCH_DIR)/cacao/
	install -m 644 cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/server/Xusage.txt \
		$(BUILD_JRE_ARCH_DIR)/cacao/
	printf -- '-cacao KNOWN\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
else
	printf -- '-cacao ERROR\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
	touch $@

clean-add-cacao:
	rm -rf $(BUILD_JRE_ARCH_DIR)/cacao
	if [ -e $(BUILD_JRE_ARCH_DIR)/jvm.cfg ] ; then \
	  sed -i 's#-cacao KNOWN#-cacao ERROR#' $(BUILD_JRE_ARCH_DIR)/jvm.cfg ; \
	fi
	rm -f stamps/add-cacao.stamp

stamps/add-cacao-debug.stamp: stamps/icedtea-debug.stamp stamps/cacao.stamp
if ADD_CACAO_BUILD
	mkdir -p $(BUILD_DEBUG_JRE_ARCH_DIR)/cacao
	install -m 644 cacao/install/lib/libjvm.so \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/cacao/
	install -m 644 cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/libjsig.so \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/cacao/
	install -m 644 cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/server/Xusage.txt \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/cacao/
	printf -- '-cacao KNOWN\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
else
	printf -- '-cacao ERROR\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
	touch $@

clean-add-cacao-debug:
	rm -rf $(BUILD_DEBUG_JRE_ARCH_DIR)/cacao
	if [ -e $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg ] ; then \
	  sed -i 's#-cacao KNOWN#-cacao ERROR#' $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg ; \
	fi
	rm -f stamps/add-cacao-debug.stamp

# configure script arguments, quoted in single quotes
CONFIGURE_ARGS = @CONFIGURE_ARGS@
ADD_ZERO_CONFIGURE_ARGS = \
	--with-jdk-home=$(BUILD_OUTPUT_DIR)/j2sdk-image \
	--enable-zero
if ADD_SHARK_BUILD
ADD_ZERO_CONFIGURE_ARGS += \
	--enable-shark
endif
ADD_ZERO_CONFIGURE_ARGS += \
	--disable-docs \
	$(filter-out '--with-jdk-home=% '--with-ecj=% \
			'--with-java=% '--with-javah=% \
			'--with-javac=% '--with-javac=% \
			'--with-rmic=% '--with-additional-vms=% \
			'--with-openjdk '--with-openjdk=% , \
		$(CONFIGURE_ARGS)) \
	$(if $(findstring --with-openjdk-src-zip=, $(CONFIGURE_ARGS)),, \
	  --with-openjdk-src-zip=$(abs_top_builddir)/$(OPENJDK_SRC_ZIP))
if WITH_ALT_HSBUILD
ADD_ZERO_CONFIGURE_ARGS += \
	$(if $(findstring --with-hotspot-src-zip=, $(CONFIGURE_ARGS)),, \
	  --with-hotspot-src-zip=$(abs_top_builddir)/$(HOTSPOT_SRC_ZIP))
endif
ADD_ZERO_CONFIGURE_ARGS += --disable-bootstrap

ADD_ZERO_EXTRA_BUILD_ENV = \
	BUILD_LANGTOOLS=false ALT_LANGTOOLS_DIST=$(BUILD_OUTPUT_DIR)/langtools/dist \
	BUILD_JAXP=false      ALT_JAXP_DIST=$(BUILD_OUTPUT_DIR)/jaxp/dist \
	BUILD_JAXWS=false     ALT_JAXWS_DIST=$(BUILD_OUTPUT_DIR)/jaxws/dist \
	BUILD_CORBA=false     ALT_CORBA_DIST=$(BUILD_OUTPUT_DIR)/corba/dist \
	BUILD_JDK=false \
	DISTRIBUTION_PATCHES='$(foreach p,$(DISTRIBUTION_PATCHES),$(if $(findstring cacao,$(p)),,$(p)))'

stamps/add-zero.stamp: stamps/icedtea.stamp
if ADD_ZERO_BUILD
	mkdir -p zerovm

	cd zerovm && \
	    $(ADD_ZERO_EXTRA_BUILD_ENV) \
		$(ARCH_PREFIX) $(abs_top_srcdir)/configure $(ADD_ZERO_CONFIGURE_ARGS) && \
	    ln -s ../drops

	: # create directories which are expected by icedtea components,
	: # implicitly assumed to be created by the jdk build.
	mkdir -p $(patsubst $(abs_top_builddir)/%,$(abs_top_builddir)/zerovm/%, \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR) \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/man/man1 \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR) \
	  $(ECJ_BUILD_OUTPUT_DIR)/j2re-image/man/man1 \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR) \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/man/man1 \
	  $(BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR) \
	  $(BUILD_OUTPUT_DIR)/j2re-image/man/man1 \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR) \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2sdk-image/man/man1 \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR) \
	  $(DEBUG_BUILD_OUTPUT_DIR)/j2re-image/man/man1)

	$(ADD_ZERO_EXTRA_BUILD_ENV) \
		$(ARCH_PREFIX) $(MAKE) -C zerovm $(ICEDTEA_BUILD_TARGET)

if ZERO_BUILD
	mkdir -p $(BUILD_JRE_ARCH_DIR)/shark
	cp -a zerovm/$(BUILD_DIR)/hotspot/import/jre/lib/$(INSTALL_ARCH_DIR)/server/* \
		$(BUILD_JRE_ARCH_DIR)/shark/
	printf -- '-shark KNOWN\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
else
	mkdir -p $(BUILD_JRE_ARCH_DIR)/zero
	cp -a zerovm/$(BUILD_DIR)/hotspot/import/jre/lib/$(INSTALL_ARCH_DIR)/server/* \
		$(BUILD_JRE_ARCH_DIR)/zero/
	printf -- '-zero KNOWN\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
if ADD_SHARK_BUILD
	printf -- '-shark ALIASED_TO -zero\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
else
	printf -- '-shark ERROR\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
endif
else
	printf -- '-zero ERROR\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
	printf -- '-shark ERROR\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
	touch $@

clean-add-zero:
	rm -rf $(BUILD_JRE_ARCH_DIR)/zero
	rm -rf $(BUILD_JRE_ARCH_DIR)/shark
	rm -rf zerovm
	if [ -e $(BUILD_JRE_ARCH_DIR)/jvm.cfg ] ; then \
	  sed -i 's#-zero KNOWN#-zero ERROR#' $(BUILD_JRE_ARCH_DIR)/jvm.cfg ; \
	  sed -i 's#-shark KNOWN#-shark ERROR#' $(BUILD_JRE_ARCH_DIR)/jvm.cfg ; \
	fi
	rm -f stamps/add-zero.stamp

stamps/add-zero-debug.stamp: stamps/icedtea-debug.stamp
if ADD_ZERO_BUILD
	mkdir -p zerovm

	cd zerovm && \
	    $(ADD_ZERO_EXTRA_BUILD_ENV) \
		$(ARCH_PREFIX) $(abs_top_srcdir)/configure $(ADD_ZERO_CONFIGURE_ARGS) && \
	    ln -s ../drops

	$(ADD_ZERO_EXTRA_BUILD_ENV) \
		$(ARCH_PREFIX) $(MAKE) -C zerovm $(ICEDTEA_DEBUG_BUILD_TARGET)

if ZERO_BUILD
	mkdir -p $(BUILD_DEBUG_JRE_ARCH_DIR)/shark
	cp -a zerovm/$(BUILD_DIR)/hotspot/import/jre/lib/$(INSTALL_ARCH_DIR)/server/* \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/shark/
	printf -- '-shark KNOWN\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
else
	mkdir -p $(BUILD_DEBUG_JRE_ARCH_DIR)/zero
	cp -a zerovm/$(BUILD_DIR)/hotspot/import/jre/lib/$(INSTALL_ARCH_DIR)/server/* \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/zero/
	printf -- '-zero KNOWN\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
else
	printf -- '-zero ERROR\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
	printf -- '-shark ERROR\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
	touch $@

clean-add-zero-debug:
	rm -rf $(BUILD_DEBUG_JRE_ARCH_DIR)/zero
	rm -rf $(BUILD_JRE_ARCH_DIR)/shark
	rm -rf zerovm
	if [ -e $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg ] ; then \
	  sed -i 's#-zero KNOWN#-zero ERROR#' $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg ; \
	  sed -i 's#-shark KNOWN#-shark ERROR#' $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg ; \
	fi
	rm -f stamps/add-zero-debug.stamp

# end additional VMs


# jtreg

stamps/jtreg.stamp: stamps/icedtea-against-icedtea.stamp
	rm -rf test/jtreg/classes
	mkdir -p test/jtreg/classes
	$(BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) -d test/jtreg/classes \
	   -encoding iso-8859-1 `find $(JTREG_SRCS) -name '*.java'`
	(cd $(JTREG_SRCS); \
	 $(BOOT_DIR)/bin/jar cfm $(abs_top_builddir)/test/jtreg.jar \
	   META-INF/MANIFEST.MF \
	   legal  README JavaTest.cmdMgrs.lst JavaTest.toolMgrs.lst \
	   `find com -type f -a -not -name '*.java'` \
	   -C $(abs_top_builddir)/test/jtreg/classes com)
	mkdir -p stamps
	touch $@

clean-jtreg: clean-jtreg-reports
	rm -rf test/jtreg/classes
	if [ -e test/jtreg ] ; then \
	  rmdir test/jtreg ; \
	fi
	rm -f test/jtreg.jar
	rm -f stamps/jtreg.stamp

check-hotspot: stamps/jtreg.stamp
	mkdir -p test/hotspot/JTwork test/hotspot/JTreport
	$(BOOT_DIR)/bin/java -jar test/jtreg.jar -v1 -a -ignore:quiet \
		-w:test/hotspot/JTwork -r:test/hotspot/JTreport \
		-jdk:$(BUILD_OUTPUT_DIR)/j2sdk-image \
		$(ICEDTEA_JTREG_OPTIONS) \
		`pwd`/openjdk/hotspot/test \
	    | tee test/$@.log
	test -z `grep \"^Error:\|^FAILED:\" test/$@.log`

check-langtools: stamps/jtreg.stamp
	mkdir -p test/langtools/JTwork test/langtools/JTreport
	$(BOOT_DIR)/bin/java -jar test/jtreg.jar -v1 -a -ignore:quiet \
		-w:test/langtools/JTwork -r:test/langtools/JTreport \
		$${ICEDTEA_JTREG_OTHERVM:--samevm} \
		-jdk:$(BUILD_OUTPUT_DIR)/j2sdk-image \
		$(ICEDTEA_JTREG_OPTIONS) \
		`pwd`/openjdk/langtools/test \
	    | tee test/$@.log
	test -z `grep \"^Error:\|^FAILED:\" test/$@.log`

check-jdk: stamps/jtreg.stamp
	mkdir -p test/jdk/JTwork test/jdk/JTreport
	if test "x$${DISPLAY}" = "x"; then XVFB_RUN="@XVFB_RUN_CMD@"; fi; \
	if test "x$${DISPLAY}" = "x" && test "x$${XVFB_RUN}" = "x"; then \
		echo "WARNING: DISPLAY not set and xvfb-run not found"; \
	fi; \
	$${XVFB_RUN} \
	$(BOOT_DIR)/bin/java -jar test/jtreg.jar -v1 -a -ignore:quiet \
		-w:test/jdk/JTwork -r:test/jdk/JTreport \
		 $${ICEDTEA_JTREG_OTHERVM:--samevm} \
		-jdk:$(BUILD_OUTPUT_DIR)/j2sdk-image \
		-exclude:$(abs_top_srcdir)/$(JTREG_DIR)/excludelist.jdk.jtx \
		$(ICEDTEA_JTREG_OPTIONS) \
		`pwd`/openjdk/jdk/test \
	    | tee test/$@.log
	test -z `grep \"^Error:\|^FAILED:\" test/$@.log`

clean-jtreg-reports:
	rm -rf test/hotspot test/langtools test/jdk
	rm -f test/check-*.log test/jtreg-summary.log

# FIXME: this might need some adjustment for other OS than Linux
jtreg_processes = ps x -ww -o pid,ppid,args \
	| awk '$$2 == 1 && $$3 ~ /^$(subst /,\/,/scratch)/' \
	| sed 's,$(CURDIR)/$(sdkimg),<sdkimg>,g;s,$(CURDIR),<pwd>,g'
jtreg_pids = ps x --no-headers -ww -o pid,ppid,args \
	| awk '$$2 == 1 && $$3 ~ /^$(subst /,\/,$(CURDIR)/$(sdkimg))/ {print $$1}'

jtregcheck: jtreg $(TEST_SUITES:%=check-%)
	for i in $(TEST_SUITES); do \
	  echo "--------------- jtreg console summary for $$i ---------------"; \
	  egrep -v '^(Passed:|Directory|Re[a-z]+\ written\ to)' test/check-$$i.log; \
	done | tee test/jtreg-summary.log

	: # kill testsuite processes still hanging
	@pids=$$($(jtreg_pids)); \
	if [ -n "$$pids" ]; then \
	  echo "killing processes..."; \
	  $(jtreg_processes); \
	  kill -1 $$pids; \
	  sleep 2; \
	  pids=$$($(jtreg_pids)); \
	  if [ -n "$$pids" ]; then \
	    echo "try harder..."; \
	    $(jtreg_processes); \
	    kill -9 $$pids; \
	    sleep 2; \
	  fi; \
	else \
	  echo "nothing to cleanup"; \
	fi; \
	pids=$$($(jtreg_pids)); \
	if [ -n "$$pids" ]; then \
	  echo "leftover processes..."; \
	  $(jtreg_processes); \
	fi

check-tapset-probes: 
if ENABLE_SYSTEMTAP
	$(abs_top_srcdir)/test/tapset/jstaptest.pl \
	  -B $(BUILD_OUTPUT_DIR) -A $(BUILD_ARCH_DIR) \
	  -S $(abs_top_srcdir)/test/tapset \
	  -a test/check-stap.log -p
endif
check-tapset-jstack: 
if ENABLE_SYSTEMTAP
	$(abs_top_srcdir)/test/tapset/jstaptest.pl \
	  -B $(BUILD_OUTPUT_DIR) -A $(BUILD_ARCH_DIR) \
	  -S $(abs_top_srcdir)/test/tapset \
	  -a test/check-stap.log -j
endif
check-tapset: check-tapset-probes check-tapset-jstack

clean-tapset-report:
if ENABLE_SYSTEMTAP
	rm -f test/check-stap.log
endif

# Support classes for non-OpenJDK bootstraps

# rt.jar additional class files.
rt-source-files.txt: $(OPENJDK_ECJ_TREE)
	rm -f $@
	for files in $(ICEDTEA_BOOTSTRAP_CLASSES) ; \
	do \
	  echo $$files >> $@ ; \
	done
	touch $@

stamps/rt-class-files.stamp: $(INITIAL_BOOTSTRAP_LINK_STAMP) rt-source-files.txt
if BOOTSTRAPPING
	mkdir -p lib/rt
	if echo $(ICEDTEA_BOOTSTRAP_CLASSES) | grep '\S' &> /dev/null ; then \
	  $(BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) -d lib/rt \
            -classpath $(SYSTEM_JDK_DIR)/jre/lib/rt.jar \
            -sourcepath $(SOURCEPATH_DIRS) \
	    -bootclasspath \'\' @rt-source-files.txt ; \
	fi
endif
	mkdir -p stamps
	touch stamps/rt-class-files.stamp

clean-rt:
	rm -rf lib/rt
	rm -f stamps/rt-class-files.stamp
	rm -f stamps/rt.stamp
	rm -f rt-source-files.txt
if BOOTSTRAPPING
	if [ -e $(ECJ_BOOT_DIR) ] ; then \
	  mkdir -p $(ECJ_BOOT_DIR)/jre/lib ; \
	  cp $(SYSTEM_JDK_DIR)/jre/lib/rt.jar $(ECJ_BOOT_DIR)/jre/lib/rt.jar ; \
	fi
endif

stamps/rt.stamp: stamps/rt-class-files.stamp
	mkdir -p stamps
if BOOTSTRAPPING
	if echo $(ICEDTEA_BOOTSTRAP_CLASSES) | grep '\S' &> /dev/null ; then \
	  $(BOOT_DIR)/bin/jar uf $(RUNTIME) -C lib/rt com -C lib/rt java \
	    -C lib/rt javax -C lib/rt sun ; \
	fi 
endif
	touch stamps/rt.stamp

# Target Aliases
# ===============

add-archive: stamps/add-archive.stamp

add-archive-debug: stamps/add-archive-debug.stamp

add-archive-ecj: stamps/add-archive-ecj.stamp

bootstrap-directory-ecj: stamps/bootstrap-directory-ecj.stamp

bootstrap-directory: stamps/bootstrap-directory.stamp

bootstrap-directory-symlink-ecj: stamps/bootstrap-directory-symlink-ecj.stamp

bootstrap-directory-symlink: stamps/bootstrap-directory-symlink.stamp

cacao: stamps/cacao.stamp

nbplatform: stamps/nbplatform.stamp

download: stamps/download.stamp

download-cacao: stamps/download-cacao.stamp

download-drops: stamps/download-drops.stamp

download-hotspot: stamps/download-hotspot.stamp

download-jamvm: stamps/download-jamvm.stamp

download-jaf-drop: stamps/download-jaf-drop.stamp

download-jaxp-drop: stamps/download-jaxp-drop.stamp

download-jaxws-drop: stamps/download-jaxws-drop.stamp

download-openjdk: stamps/download-openjdk.stamp

extract: stamps/extract.stamp

extract-cacao: stamps/extract-cacao.stamp

extract-ecj: stamps/extract-ecj.stamp

extract-jamvm: stamps/extract-jamvm.stamp

hotspot-ports: stamps/ports.stamp

icedtea: stamps/icedtea.stamp

icedtea-against-icedtea: stamps/icedtea-against-icedtea.stamp

icedtea-against-ecj: stamps/icedtea-against-ecj.stamp

icedtea-debug: stamps/icedtea-debug.stamp

icedtea-debug-against-icedtea: stamps/icedtea-debug-against-icedtea.stamp

icedtea-ecj: stamps/icedtea-ecj.stamp

jamvm: stamps/jamvm.stamp

jtreg: stamps/jtreg.stamp

liveconnect: stamps/liveconnect.stamp

liveconnect-dist: stamps/liveconnect-dist.stamp

native-ecj: stamps/native-ecj.stamp

overlay: stamps/overlay.stamp

patch: stamps/patch.stamp

patch-ecj: stamps/patch-ecj.stamp

patch-fsg: stamps/patch-fsg.stamp

pax-mark-vm: stamps/pax-mark-vm.stamp

pax-mark-vm-debug: stamps/pax-mark-vm-debug.stamp

pax-mark-vm-ecj: stamps/pax-mark-vm-ecj.stamp

pulse-java: stamps/pulse-java.stamp

rewriter: stamps/rewriter.stamp

rewrite-rhino: stamps/rewrite-rhino.stamp

replace-hotspot: stamps/replace-hotspot.stamp

rt-jar: stamps/rt.stamp

rt-class-files: stamps/rt-class-files.stamp

tools-jar: stamps/tools.stamp
