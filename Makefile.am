# Dependencies

OPENJDK_DATE = 16_feb_2010
OPENJDK_MD5SUM = 94db01691ab38f98b7d42b2ebf4d5c0b
OPENJDK_VERSION = b18
OPENJDK_URL = http://download.java.net/openjdk/jdk6/promoted/$(OPENJDK_VERSION)/

CACAO_VERSION = 0.99.4
CACAO_MD5SUM = c5e6525c5212ddbb6026e4a7cde37ca6
CACAO_BASE_URL = http://www.complang.tuwien.ac.at
CACAO_URL = $(CACAO_BASE_URL)/cacaojvm/download/cacao-$(CACAO_VERSION)/

NETBEANS_PROFILER_MD5SUM = a6756a62291ebea5c0e2431389b31380
NETBEANS_PROFILER_URL = http://icedtea.classpath.org/visualvm/
NETBEANS_PROFILER_SRC_ZIP = netbeans-profiler-visualvm_release65_mod.tar.gz

VISUALVM_MD5SUM = a289739f4a5bcdb9a2c642cfcc1e83fe
VISUALVM_URL = https://visualvm.dev.java.net/files/documents/7163/127170/
VISUALVM_SRC_ZIP = visualvm-111-src.tar.gz

JAXWS_DROP_URL = http://kenai.com/projects/jdk6-drops/downloads/download
JAXWS_DROP_ZIP = jdk6-jaxws-2009_10_27.zip
JAXWS_DROP_SHA256SUM = 155ff3be83c980e197621a2fbf7ee34e8e0f536489351a5865cf0e52206245e2
JAF_DROP_ZIP = jdk6-jaf-2009_10_27.zip
JAF_DROP_SHA256SUM = fdc51476fc6bcc69ea1f099f33e84601a126bfa8b11c8fa11c25dc574345aa9f
JAXP_DROP_URL = https://jaxp.dev.java.net/files/documents/913/147491
JAXP_DROP_ZIP = jdk6-jaxp-2010_01_15.zip
JAXP_DROP_SHA256SUM = 181615cfec1c3721a7d8f278fa25b392be4247a496c7774a10cb9df37684f94f

OPENJDK_HG_URL = http://hg.openjdk.java.net/jdk6/jdk6

# Build directories

OS_DIR = $(BUILD_OS_DIR)-$(BUILD_ARCH_DIR)
BUILD_OUTPUT_DIR = openjdk/build/$(OS_DIR)
ECJ_BUILD_OUTPUT_DIR = openjdk-ecj/build/$(OS_DIR)
ICEDTEA_BUILD_DIR = \
	$(abs_top_builddir)/$(BUILD_OUTPUT_DIR)
ICEDTEA_CLS_DIR = \
	$(abs_top_builddir)/$(BUILD_OUTPUT_DIR)/classes
ICEDTEA_BOOT_DIR= \
	$(abs_top_builddir)/bootstrap/jdk1.6.0
ICEDTEA_RT = \
	$(ICEDTEA_BOOT_DIR)/jre/lib/rt.jar
ICEDTEA_ENDORSED_DIR = \
	$(ICEDTEA_BOOT_DIR)/lib/endorsed
ICEDTEA_BUILD_DIR_ECJ = \
	$(abs_top_builddir)/$(ECJ_BUILD_OUTPUT_DIR)/
ICEDTEA_CLS_DIR_ECJ = \
	$(abs_top_builddir)/$(ECJ_BUILD_OUTPUT_DIR)/classes
SERVER_DIR = hotspot/import/jre/lib/$(INSTALL_ARCH_DIR)/server
BUILD_JRE_ARCH_DIR = $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
BUILD_DEBUG_JRE_ARCH_DIR = $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)

# Source directories

SHARE = openjdk-ecj/jdk/src/share/classes
SOLARIS = openjdk-ecj/jdk/src/solaris/classes
LANGTOOLS = openjdk-ecj/langtools/src/share/classes
CORBA = openjdk-ecj/corba/src/share/classes

NETX_SRCDIR = $(abs_top_srcdir)/netx
NETX_RESOURCE_DIR=$(NETX_SRCDIR)/net/sourceforge/jnlp/resources
NETX_EXTRA_DIR=$(abs_top_srcdir)/extra/net/sourceforge/jnlp/about/resources

OPENJDK_SOURCEPATH_DIRS = \
        $(SHARE):$(SOLARIS):$(LANGTOOLS):$(CORBA)

SOURCEPATH_DIRS = $(abs_top_builddir)/generated:$(OPENJDK_SOURCEPATH_DIRS)

# Sources used from OpenJDK.
ICEDTEA_BOOTSTRAP_DIRS = \
	$(SHARE)/com/sun/jdi \
	$(SHARE)/com/sun/net/httpserver \
	$(SHARE)/com/sun/tools/jdi \
	$(SHARE)/java/io \
	$(SHARE)/java/security/cert \
	$(SHARE)/java/util \
	$(SHARE)/java/rmi \
	$(SHARE)/sun/awt/ \
	$(SHARE)/sun/nio/cs \
	$(SHARE)/sun/rmi/rmic \
	$(SHARE)/sun/tools/java \
	$(SHARE)/javax/net/ssl \
	$(SHARE)/javax/script \
	$(SHARE)/javax/security/auth/kerberos \
	$(SHARE)/javax/security/sasl \
	$(LANGTOOLS)/com/sun/mirror \
	$(LANGTOOLS)/com/sun/tools/apt

# PR43578 - java.security.CodeSource.getCodeSigners() missing
# PR43582 - Missing javax.swing.JTable.setFillsViewportHeight
# PR43585 - java.security.KeyStore.TrustedCertificateEntry class missing
NETX_BOOTSTRAP_CLASSES = \
	$(SHARE)/java/security/CodeSource.java \
	$(SHARE)/javax/swing/JTable.java \
	$(SHARE)/java/security/KeyStore.java

# PR42003 - javax.swing.plaf.basic.BasicDirectoryModel
# PR43389 - javax.management.StandardMBean
ICEDTEA_BOOTSTRAP_CLASSES = \
	$(SHARE)/javax/swing/plaf/basic/BasicDirectoryModel.java \
	$(SHARE)/javax/management/StandardMBean.java \
	$(NETX_BOOTSTRAP_CLASSES)

# FIXME (javac): Settings for javac go here

# Flags
IT_CFLAGS=$(CFLAGS) $(ARCHFLAG)
IT_JAVAC_SETTINGS=-g -encoding utf-8 $(JAVACFLAGS) $(MEMORY_LIMIT) $(PREFER_SOURCE)
IT_LANGUAGE_SOURCE_VERSION=6
IT_CLASS_TARGET_VERSION=6
IT_JAVACFLAGS=$(IT_JAVAC_SETTINGS) -source $(IT_LANGUAGE_SOURCE_VERSION) -target $(IT_CLASS_TARGET_VERSION)

# Conditional defintions

if USE_ALT_OPENJDK_SRC_ZIP
  OPENJDK_SRC_ZIP = $(ALT_OPENJDK_SRC_ZIP)
else
if USE_HG
  OPENJDK_SRC_ZIP = 
else
  OPENJDK_SRC_ZIP = openjdk-6-src-$(OPENJDK_VERSION)-$(OPENJDK_DATE).tar.gz
endif
endif

if USE_ALT_HOTSPOT_SRC_ZIP
  HOTSPOT_SRC_ZIP = $(ALT_HOTSPOT_SRC_ZIP)
else
  HOTSPOT_SRC_ZIP = hotspot.tar.gz
endif

if USE_ALT_CACAO_SRC_ZIP
  CACAO_SRC_ZIP = $(ALT_CACAO_SRC_ZIP)
else
if USE_ALT_CACAO_SRC_DIR
  CACAO_SRC_ZIP = "not needed"
else
  CACAO_SRC_ZIP = cacao-$(CACAO_VERSION).tar.gz
endif
endif

# FIXME (HotSpot): HotSpot changeset logic goes here

if ENABLE_PLUGIN
ICEDTEAPLUGIN_CLEAN = clean-IcedTeaPlugin
LIVECONNECT_DIR = netscape sun/applet
PLUGIN_DIR=$(abs_top_builddir)/plugin/icedteanp
PLUGIN_SRCDIR=$(abs_top_srcdir)/plugin/icedteanp
LIVECONNECT_SRCS = $(PLUGIN_SRCDIR)/java
ICEDTEAPLUGIN_TARGET = $(PLUGIN_DIR)/IcedTeaPlugin.so \
	stamps/liveconnect-dist.stamp
endif

if WITH_VISUALVM
NB_PLATFORM= $(shell ls /usr/share/netbeans | grep platform | tail -n1)
NB_APISUPPORT=$(shell ls /usr/share/netbeans | grep apisupport | tail -n1)
else
NB_PLATFORM=
NB_APISUPPORT=
endif

if ENABLE_PULSE_JAVA
# include the makefile in pulseaudio subdir
PULSE_JAVA_DIR = $(abs_top_srcdir)/pulseaudio
PULSE_JAVA_NATIVE_SRCDIR = $(PULSE_JAVA_DIR)/src/native
PULSE_JAVA_NATIVE_SRCS = $(wildcard $(PULSE_JAVA_NATIVE_SRCDIR)/*.c)
PULSE_JAVA_BUILDDIR = $(abs_top_builddir)/pulseaudio
PULSE_JAVA_NATIVE_BUILDDIR = $(PULSE_JAVA_BUILDDIR)/native
PULSE_JAVA_NATIVE_OBJECTS = \
	$(subst $(PULSE_JAVA_NATIVE_SRCDIR),$(PULSE_JAVA_NATIVE_BUILDDIR),$(patsubst %.c,%.o,$(PULSE_JAVA_NATIVE_SRCS)))
PULSE_JAVA_JAVA_SRCDIR = $(PULSE_JAVA_DIR)/src/java
PULSE_JAVA_CLASS_DIR = $(PULSE_JAVA_BUILDDIR)/classes
PULSE_JAVA_TARGET = stamps/pulse-java.stamp
PULSE_JAVA_CLEAN_TARGET = clean-pulse-java
endif

# FIXME: This should not depend on bootstrapping
# but on whether MEMORY_LIMIT is accepted
# as an argument to javac
if WITH_OPENJDK
  MEMORY_LIMIT = -J-Xmx1024m
else
  MEMORY_LIMIT =
endif

if WITH_CACAO
  ICEDTEA_BUILD_TARGET=j2se_only
  ICEDTEA_DEBUG_BUILD_TARGET=j2se_fastdebug_only
else
  ICEDTEA_DEBUG_BUILD_TARGET=debug_build
endif

# FIXME (bootstrap): Assumption is WITH_OPENJDK == no bootstrap
if WITH_OPENJDK
  BOOTSTRAP_DIRECTORY_STAMP =
  SYSTEM_JDK_DIR = $(SYSTEM_OPENJDK_DIR)
  ICEDTEA_HOME = $(SYSTEM_JDK_DIR)
  INITIAL_BOOTSTRAP_LINK_STAMP = stamps/bootstrap-directory-symlink.stamp
else
  BOOTSTRAP_DIRECTORY_STAMP = stamps/bootstrap-directory.stamp
  SYSTEM_JDK_DIR = $(SYSTEM_GCJ_DIR)
  ICEDTEA_HOME = $(abs_top_builddir)/bootstrap/icedtea
  INITIAL_BOOTSTRAP_LINK_STAMP = stamps/bootstrap-directory-symlink-ecj.stamp
endif

# Target to ensure a patched OpenJDK tree containing Zero & Shark
# and any overlays is available in $(abs_top_builddir)/openjdk
OPENJDK_TREE = stamps/overlay.stamp

# Target to ensure a patched OpenJDK bootstrap tree containing
# Zero & Shark, any other overlays and the bootstrapping patches
# is available in $(abs_top_builddir)/openjdk-ecj
OPENJDK_ECJ_TREE = stamps/patch-ecj.stamp

# Sources list

PLUGIN_TEST_SRCS = $(abs_top_srcdir)/plugin/tests/LiveConnect/*.java

REWRITER_SRCS = $(abs_top_srcdir)/rewriter/com/redhat/rewriter/ClassRewriter.java

# Patch list

ICEDTEA_FSG_PATCHES =

ICEDTEA_PATCHES = \
	patches/icedtea-notice-safepoints.patch \
	patches/icedtea-parisc-opt.patch \
	patches/icedtea-lucene-crash.patch \
	patches/icedtea-version.patch \
	patches/icedtea-version-hotspot.patch \
	patches/icedtea-text-relocations.patch \
	patches/icedtea-ssl.patch \
	patches/icedtea-rmi_amd64.patch \
	patches/icedtea-tools.patch \
	patches/icedtea-use-system-tzdata.patch \
	patches/icedtea-headers.patch \
	patches/icedtea-headers-hotspot.patch \
	patches/icedtea-gcc-suffix.patch \
	patches/icedtea-gcc-suffix-hotspot.patch \
	patches/icedtea-bytebuffer-compact.patch \
	patches/memory-limits.patch \
	patches/icedtea-sunsrc.patch \
	patches/icedtea-libraries.patch \
	patches/icedtea-javafiles.patch \
	patches/icedtea-jvmtiEnv.patch \
	patches/icedtea-lcms.patch \
	patches/icedtea-timerqueue.patch \
	patches/icedtea-print-lsb-release.patch \
	patches/icedtea-jpegclasses.patch \
	patches/icedtea-uname.patch \
	patches/icedtea-freetypeversion.patch \
	patches/icedtea-shark-build.patch \
	patches/icedtea-shark-build-hotspot.patch \
	patches/icedtea-nomotif-6706121.patch \
	patches/icedtea-nomotif.patch \
	patches/icedtea-alpha-fixes.patch \
	patches/icedtea-alt-jar.patch \
	patches/icedtea-jdk-use-ssize_t.patch \
	patches/icedtea-use-idx_t.patch \
	patches/hotspot/$(HSBUILD)/params-cast-size_t.patch \
	patches/icedtea-clean-crypto.patch \
	patches/icedtea-shark.patch \
	patches/icedtea-arch.patch \
	patches/icedtea-lc_ctype.patch \
	patches/icedtea-xjc.patch \
	patches/icedtea-renderer-crossing.patch \
	patches/icedtea-stroker-finish.patch \
	patches/icedtea-linker-libs-order.patch \
	patches/icedtea-testenv.patch \
	patches/icedtea-samejvm-safe.patch \
	patches/icedtea-pr261.patch \
	patches/icedtea-doc-headers.patch \
	patches/icedtea-sparc-buildfixes.patch \
	patches/icedtea-sparc64-linux.patch \
	patches/icedtea-sparc-ptracefix.patch \
	patches/icedtea-sparc-trapsfix.patch \
	patches/icedtea-demo-swingapplet.patch \
	patches/icedtea-awt-window-size.patch \
	patches/icedtea-java2d-dasher.patch \
	patches/icedtea-jtreg-6592792.patch \
	patches/icedtea-s390-noinline.patch \
	patches/icedtea-jtreg-dnd.patch \
	patches/icedtea-jtreg-jrunscript.patch \
	patches/icedtea-network-unreachable.patch \
	patches/icedtea-dnd-filelists.patch \
	patches/icedtea-java2d-stroker-internal-joint.patch \
	patches/icedtea-java2d-stroker-internal-close-joint.patch \
	patches/icedtea-disable-cc-incompatible-sanity-checks.patch \
	patches/icedtea-explicit-target-arch.patch \
	patches/icedtea-gcc-stack-markings.patch \
	patches/icedtea-no-precompiled.patch \
	patches/icedtea-linux-separate-debuginfo.patch \
	patches/icedtea-parisc.patch \
	patches/icedtea-sh4-support.patch \
	patches/libpng.patch \
	patches/zero.patch \
	patches/shark.patch \
	patches/extensions/netx.patch \
	patches/extensions/netx-dist.patch \
	patches/extensions/netx-umask.patch \
	patches/icedtea-jtreg-httpTest.patch

if WITH_ALT_HSBUILD
ICEDTEA_PATCHES += \
	patches/openjdk/6896472-missing_libjsig.patch \
	patches/hotspot/$(HSBUILD)/6873059-javac-versioning-hotspot.patch
endif

if WITH_RHINO
ICEDTEA_PATCHES += \
	patches/icedtea-rhino.patch
endif

if ENABLE_PLUGIN
ICEDTEA_PATCHES += \
	patches/extensions/liveconnect.patch \
	patches/extensions/liveconnect-dist.patch
endif

if BUILD_CACAO
ICEDTEA_PATCHES += \
	patches/icedtea-cacao.patch \
	patches/icedtea-cacao-no-mmap-first-page.patch \
	patches/cacao/no-strict-aliasing.patch \
	patches/cacao/arm-arch-defines.patch
if ENABLE_NIO2
ICEDTEA_PATCHES += patches/cacao/nio2.patch
endif
endif

if WITH_CACAO
ICEDTEA_PATCHES += \
	patches/icedtea-cacao-ignore-jdi-tests.patch \
	patches/icedtea-cacao-ignore-tests.patch
endif

if ENABLE_PULSE_JAVA
ICEDTEA_PATCHES += \
	patches/icedtea-pulse-soundproperties.patch
endif

if ENABLE_XRENDER
# match against $(abs_top_srcdir) and then remove it again,
# because stamps/patch.stamp target will also add it
XRENDER_PATCHES = patches/xrender/icedtea-???.patch
XRENDER_PATCH_FILES = $(sort $(wildcard $(abs_top_srcdir)/$(XRENDER_PATCHES)))
ICEDTEA_PATCHES += $(sort $(subst $(abs_top_srcdir)/,,$(XRENDER_PATCH_FILES)))
endif

if ENABLE_NIO2
ICEDTEA_PATCHES += patches/icedtea-nio2.patch
endif

if ENABLE_SYSTEMTAP
ICEDTEA_PATCHES += patches/hotspot/$(HSBUILD)/systemtap.patch
endif

if ENABLE_NSS
ICEDTEA_PATCHES += patches/icedtea-nss-config.patch
endif

ICEDTEA_PATCHES += $(DISTRIBUTION_PATCHES)

# Bootstrapping patches

ICEDTEA_ECJ_PATCHES = patches/ecj/icedtea.patch \
	patches/ecj/icedtea-hotspot.patch \
	patches/ecj/icedtea-spp.patch \
	patches/ecj/icedtea-jopt.patch \
	patches/ecj/icedtea-jaxp-dependency.patch \
	patches/ecj/bootver.patch \
	patches/ecj/getannotation-cast.patch \
	patches/ecj/override.patch
if DTDTYPE_QNAME
ICEDTEA_ECJ_PATCHES += \
	patches/ecj/icedtea-jaxws-getdtdtype.patch
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

PLUGIN_VERSION = $(ICEDTEA_NAME) $(PACKAGE_VERSION)$(ICEDTEA_REV)$(ICEDTEA_PKG)

ICEDTEA_ENV = \
	ALT_JDK_IMPORT_PATH="$(ICEDTEA_BOOT_DIR)" \
	ANT="$(ANT)" \
        BUILD_NUMBER="$(OPENJDK_VERSION)" \
	JDK_UPDATE_VERSION="$(JDK_UPDATE_VERSION)" \
        JRE_RELEASE_VERSION="1.6.0_$(COMBINED_VERSION)" \
	MILESTONE="fcs" \
	LANG="C" \
	PATH="$(abs_top_builddir)/bootstrap/jdk1.6.0/bin:$(OS_PATH):$$PATH" \
	ALT_BOOTDIR="$(ICEDTEA_BOOT_DIR)" \
	BUILD_ARCH_DIR="$(BUILD_ARCH_DIR)" \
	ICEDTEA_BUILD_DIR="$(ICEDTEA_BUILD_DIR)" \
	ICEDTEA_CLS_DIR="$(ICEDTEA_CLS_DIR)" \
	ICEDTEA_ENDORSED_DIR="$(ICEDTEA_ENDORSED_DIR)" \
	ENDORSED="-Djava.endorsed.dirs=$(ICEDTEA_ENDORSED_DIR)" \
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
	DISTRIBUTION_ID="$(DIST_ID)" \
	DERIVATIVE_ID="$(ICEDTEA_NAME) $(PACKAGE_VERSION)$(ICEDTEA_REV)" \
	DEBUG_CLASSFILES="true" \
	DEBUG_BINARIES="true" \
	ALT_DROPS_DIR="$(abs_top_builddir)/drops" \
	VERBOSE="$(VERBOSE)" \
	ALT_NETX_DIST="$(abs_top_builddir)/netx.build" \
	ALT_LIVECONNECT_DIST="$(abs_top_builddir)/liveconnect"

if WITH_CACAO
ICEDTEA_ENV += \
	ALT_HOTSPOT_IMPORT_PATH="$(CACAO_IMPORT_PATH)"
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
	JAVA_TOOLS_DIR="$(ICEDTEA_BOOT_DIR)/bin" \
	ICEDTEA_RT="$(ICEDTEA_RT)" \
	ICEDTEA_BUILD_DIR="$(ICEDTEA_BUILD_DIR_ECJ)" \
	ICEDTEA_CLS_DIR="$(ICEDTEA_CLS_DIR_ECJ)" \
	BOOTCLASSPATH_CLS_RT="-bootclasspath $(ICEDTEA_CLS_DIR_ECJ):$(ICEDTEA_RT)" \
	BOOTCLASSPATH_CLS="-bootclasspath $(ICEDTEA_CLS_DIR_ECJ)" \
	BOOTCLASSPATH_RT_LIBGCJ="-bootclasspath $(ICEDTEA_RT)" \
	GENSRCDIR="$(abs_top_builddir)/generated" \
	JAR_KNOWS_ATFILE="$(JAR_KNOWS_ATFILE)" \
	JAR_KNOWS_J_OPTIONS="$(JAR_KNOWS_J_OPTIONS)" \
	JAR_ACCEPTS_STDIN_LIST="$(JAR_ACCEPTS_STDIN_LIST)" \
	DISABLE_NIMBUS="true" \
	NO_DOCS="true"

# Source files
# FIXME (distclean): Add generated file list
# FIXME (distclean): Add jtreg sources
# FIXME (distclean): Add pulseaudio sources

EXTRA_DIST = generated \
	$(abs_top_srcdir)/patches/* \
	contrib ports \
	extra overlays \
	javaws.png javaws.desktop visualvm.desktop \
	jconsole.desktop policytool.desktop \
	test/jtreg \
	HACKING pulseaudio fsg.sh \
	$(abs_top_srcdir)/plugin \
	hotspot.map \
	autogen.sh \
	tapset/hotspot.stp.in \
	tapset/hotspot_jni.stp.in \
	scripts/jni_create_stap.c \
	scripts/jni_desc \
	rewriter/agpl-3.0.txt \
	$(REWRITER_SRCS) \
	THANKYOU

# Top-Level Targets
# =================

all-local: icedtea-against-icedtea

check-local: jtregcheck

#FIXME (clean): Should become clean-local.
distclean-local: clean-copy clean-jtreg clean-jtreg-reports $(PULSE_JAVA_CLEAN_TARGET) \
 clean-netx clean-plugin clean-liveconnect
	rm -rf stamps
	rm -f rt-source-files.txt \
	  extra-source-files.txt
	rm -rf bootstrap
	rm -rf lib
	rm -rf extra-lib
	rm -rf openjdk-ecj
	rm -rf openjdk
	rm -rf visualvm
	rm -rf netbeans

if BUILD_CACAO
	rm -rf cacao
endif
	rm -f jni-common.o
if ADD_ZERO_BUILD
	rm -rf zerovm
endif

#FIXME (clean): Missing distclean-local for downloads only

install:

.PHONY: \
	env env-ecj snapshot clean-clone clean-patch \
	clean-clone-ecj clean-patch-ecj clean-bootstrap-directory \
	clean-bootstrap-directory-symlink clean-bootstrap-directory-ecj \
	clean-bootstrap-directory-symlink-ecj icedtea icedtea-debug \
	clean-icedtea icedtea-against-icedtea clean-icedtea-ecj \
	clean-tools-jar clean-visualvm clean-nbplatform \
	clean-copy clean-rt $(ICEDTEAPLUGIN_CLEAN) hotspot \
	hotspot-helper clean-extra clean-jtreg clean-jtreg-reports 

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
if OPENJDK_SRC_DIR_FOUND
else
if USE_ALT_OPENJDK_SRC_ZIP
else
if !USE_HG
else
	if ! $(HG) fclone -h; \
          then \
          echo "No forest extension found. Please refer to" \
            "http://selenic.com/mercurial/wiki/index.cgi/ForestExtension"; \
          exit 1; \
          fi;
endif
endif
endif
	mkdir -p stamps 
	touch stamps/hgforest.stamp

clean-hgforest:
	rm -f stamps/hgforest.stamp

#FIXME (meta): Split into multiple targets
#FIXME (missing): Download drops targets

stamps/download-jaxp-drop.stamp:
	mkdir -p drops
if USE_ALT_JAXP_DROP_ZIP
	ln -sf $(ALT_JAXP_DROP_ZIP) drops/$(JAXP_DROP_ZIP)
endif
	if ! echo "$(JAXP_DROP_SHA256SUM)  drops/$(JAXP_DROP_ZIP)" \
	  | $(SHA256SUM) --check ; \
	then \
	  if [ -f drops/$(JAXP_DROP_ZIP) ] ; \
	  then \
	    mv drops/$(JAXP_DROP_ZIP) drops/$(JAXP_DROP_ZIP).old ; \
	  fi ; \
	  $(WGET) $(JAXP_DROP_URL)/$(JAXP_DROP_ZIP) -O drops/$(JAXP_DROP_ZIP); \
	  if ! echo "$(JAXP_DROP_SHA256SUM)  drops/$(JAXP_DROP_ZIP)" \
	    | $(SHA256SUM) --check ; \
	  then echo "ERROR: Bad download of jaxp drop zip"; false; \
	  fi; \
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
	  if [ -f drops/$(JAF_DROP_ZIP) ] ; \
	  then \
	    mv drops/$(JAF_DROP_ZIP) drops/$(JAF_DROP_ZIP).old ; \
	  fi ; \
	  $(WGET) $(JAXWS_DROP_URL)/$(JAF_DROP_ZIP) -O drops/$(JAF_DROP_ZIP); \
	  if ! echo "$(JAF_DROP_SHA256SUM)  drops/$(JAF_DROP_ZIP)" \
	    | $(SHA256SUM) --check ; \
	  then echo "ERROR: Bad download of jaf drop zip"; false; \
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
	  if [ -f drops/$(JAXWS_DROP_ZIP) ] ; \
	  then \
	    mv drops/$(JAXWS_DROP_ZIP) drops/$(JAXWS_DROP_ZIP).old ; \
	  fi ; \
	  $(WGET) $(JAXWS_DROP_URL)/$(JAXWS_DROP_ZIP) -O drops/$(JAXWS_DROP_ZIP); \
	  if ! echo "$(JAXWS_DROP_SHA256SUM)  drops/$(JAXWS_DROP_ZIP)" \
	    | $(SHA256SUM) --check ; \
	  then echo "ERROR: Bad download of jaxws drop zip"; false; \
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

clean-drops: clean-download-jaxp-drop clean-download-jaf-drop \
 clean-download-jaxws-drop
	if [ -e drops ] ; then \
	  rmdir drops ; \
	fi
	rm -f stamps/download-drops.stamp

stamps/download.stamp: stamps/hgforest.stamp stamps/download-drops.stamp
if OPENJDK_SRC_DIR_FOUND
else
if USE_ALT_OPENJDK_SRC_ZIP
else
if USE_HG
if WITH_HGREV
	$(HG) fclone -r $(HGREV) $(OPENJDK_HG_URL) openjdk;
else
	$(HG) fclone $(OPENJDK_HG_URL) openjdk;
endif
else
	if ! echo "$(OPENJDK_MD5SUM)  $(OPENJDK_SRC_ZIP)" \
	  | $(MD5SUM) --check ; \
	then \
	  if [ $(OPENJDK_SRC_ZIP) ] ; \
	  then \
	    mv $(OPENJDK_SRC_ZIP) $(OPENJDK_SRC_ZIP).old ; \
	  fi ; \
	  $(WGET) $(OPENJDK_URL)$(OPENJDK_SRC_ZIP) -O $(OPENJDK_SRC_ZIP); \
	fi
endif
endif
if WITH_ALT_HSBUILD
if USE_ALT_HOTSPOT_SRC_ZIP
else
	hotspot_md5sum="`$(AWK) 'version==$$1 {print $$4}' version=$(HSBUILD) \
	  $(abs_top_srcdir)/hotspot.map`" ; \
	if ! echo "$${hotspot_md5sum}  $(HOTSPOT_SRC_ZIP)" \
	  | $(MD5SUM) --check ; \
	then \
	  if [ $(HOTSPOT_SRC_ZIP) ] ; \
	  then \
	    mv $(HOTSPOT_SRC_ZIP) $(HOTSPOT_SRC_ZIP).old ; \
	  fi ; \
	  hotspot_url="`$(AWK) 'version==$$1 {print $$2 "/archive/" $$3 ".tar.gz"}' \
	    version=$(HSBUILD) $(abs_top_srcdir)/hotspot.map`"; \
	  $(WGET) $${hotspot_url} -O $(HOTSPOT_SRC_ZIP) ; \
	fi
endif
endif
endif
if BUILD_CACAO
if !USE_SYSTEM_CACAO
if USE_ALT_CACAO_SRC_ZIP
else
if USE_ALT_CACAO_SRC_DIR
else
	if ! echo "$(CACAO_MD5SUM)  $(CACAO_SRC_ZIP)" \
	 | $(MD5SUM) --check ; \
	then \
	 if [ $(CACAO_SRC_ZIP) ] ; \
	 then \
	   mv $(CACAO_SRC_ZIP) $(CACAO_SRC_ZIP).old ; \
	 fi ; \
	 $(WGET) $(CACAO_URL)$(CACAO_SRC_ZIP) -O $(CACAO_SRC_ZIP); \
	fi
endif
endif
endif
endif
if WITH_VISUALVM
	if ! echo "$(NETBEANS_PROFILER_MD5SUM)  $(NETBEANS_PROFILER_SRC_ZIP)" \
	 | $(MD5SUM) --check ; \
	then \
	 if [ $(NETBEANS_PROFILER_SRC_ZIP) ] ; \
	 then \
	  mv $(NETBEANS_PROFILER_SRC_ZIP) $(NETBEANS_PROFILER_SRC_ZIP).old ; \
	 fi ; \
	 $(WGET) $(NETBEANS_PROFILER_URL)$(NETBEANS_PROFILER_SRC_ZIP) \
	  -O $(NETBEANS_PROFILER_SRC_ZIP) ; \
	 fi

	if ! echo "$(VISUALVM_MD5SUM)  $(VISUALVM_SRC_ZIP)" \
         | $(MD5SUM) --check ; \
        then \
         if [ $(VISUALVM_SRC_ZIP) ] ; \
         then \
          mv $(VISUALVM_SRC_ZIP) $(VISUALVM_SRC_ZIP).old ; \
         fi ; \
         $(WGET) $(VISUALVM_URL)$(VISUALVM_SRC_ZIP) \
          -O $(VISUALVM_SRC_ZIP) ; \
         fi
endif
	mkdir -p stamps
	touch stamps/download.stamp

#FIXME (meta): split into multiple targets
clean-download: clean-drops
	rm -f stamps/download.stamp
	rm -f $(OPENJDK_SRC_ZIP)
if BUILD_CACAO
if USE_ALT_CACAO_SRC_DIR
else
	rm -f $(CACAO_SRC_ZIP)
endif
endif
if WITH_VISUALVM
	rm -f $(VISUALVM_SRC_ZIP)
	rm -f $(NETBEANS_PROFILER_SRC_ZIP)
endif

#FIXME (meta): Split into multiple targets
stamps/extract.stamp: stamps/extract-openjdk.stamp
	mkdir -p stamps
	touch $@

clean-extract: 
	rm -f stamps/extract.stamp

stamps/extract-openjdk.stamp: stamps/download.stamp
if OPENJDK_SRC_DIR_FOUND
	cp -a $(OPENJDK_SRC_DIR) openjdk
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
if BUILD_CACAO
if !USE_SYSTEM_CACAO
if USE_ALT_CACAO_SRC_DIR
	set -e ; \
	if ! test -d cacao ; \
	then \
	  mkdir -p cacao/cacao ; \
	  cp -r $(ALT_CACAO_SRC_DIR)/* cacao/cacao/ ; \
	fi
else
	set -e ; \
	if ! test -d cacao ; \
	then \
	  mkdir cacao ; \
	  $(TAR) xf $(CACAO_SRC_ZIP) -C cacao ; \
	  dir=$$(basename cacao/cacao-*) ; \
	  ln -s $$dir cacao/cacao ; \
	fi
endif
endif
endif
if WITH_VISUALVM
	set -e ; \
	if ! test -d netbeans ; \
	then \
	  mkdir netbeans ; \
	  $(TAR) xf $(NETBEANS_PROFILER_SRC_ZIP) -C netbeans ; \
	fi

	set -e ; \
	if ! test -d visualvm ; \
	then \
	  $(TAR) xf $(VISUALVM_SRC_ZIP) ; \
	fi
endif
	set -e ; \
	if [ ! -e $(abs_top_builddir)/generated ]; then \
	  cp -a $(abs_top_srcdir)/generated $(abs_top_builddir); \
	  find $(abs_top_builddir)/generated -type f -exec chmod 640 '{}' ';' \
	    -o -type d -exec chmod 750 '{}' ';'; \
	fi
	mkdir -p stamps
	touch stamps/extract-openjdk.stamp

stamps/replace-hotspot.stamp: stamps/extract.stamp
if WITH_ALT_HSBUILD
	if test "x${HSBUILD}" != "xoriginal"; then \
	  rm -rf openjdk/hotspot ; \
	  if test -e ${HOTSPOT_SRC_ZIP} ; \
	  then \
	    $(TAR) xf $(HOTSPOT_SRC_ZIP) ; \
	    chmod -R ug+w master-* ; \
	    mv master-$$($(AWK) 'version==$$1 {print $$3}' version=$(HSBUILD) \
	      $(abs_top_srcdir)/hotspot.map) openjdk/hotspot ; \
	  fi ; \
	fi ;
endif
	touch stamps/replace-hotspot.stamp

clean-replace-hotspot:
	rm -rf stamps/replace-hotspot.stamp

# Copy ports sources into tree
stamps/ports.stamp: stamps/replace-hotspot.stamp
	for target in $(abs_top_srcdir)/ports/hotspot/make/*/platform_zero.in \
		      $(abs_top_srcdir)/ports/hotspot/make/*/makefiles/* \
		      $(abs_top_srcdir)/ports/hotspot/tools \
		      $(abs_top_srcdir)/ports/hotspot/src/*cpu/* \
		      $(abs_top_srcdir)/ports/hotspot/src/share/vm/*; do \
	  link=$$(dirname $$target | sed 's/^.*ports/openjdk/'); \
	  cp -rv $$target $$link; \
	done
	if ! test "x$(WITH_CACAO)" = "xno" ; then \
	  mkdir -p openjdk/jdk/src/solaris/bin/$(BUILD_ARCH_DIR) ; \
	  ln -sf $(abs_top_builddir)/jvm.cfg \
	    openjdk/jdk/src/solaris/bin/$(BUILD_ARCH_DIR)/jvm.cfg ; \
	fi
	if ! test "x$(WITH_CACAO)" = "xno"; then \
	  ln -sf $(abs_top_builddir)/ergo.c \
	    openjdk/jdk/src/solaris/bin/ergo_$(BUILD_ARCH_DIR).c; \
	fi
	mkdir -p stamps
	touch stamps/ports.stamp

#FIXME (clean): Missing clean-ports

#FIXME (missing): Missing generated.stamp 

#FIXME (clean): Missing clean-generated

stamps/patch-fsg.stamp: stamps/ports.stamp
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

clean-patch-fsg:
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
	if ! test "x$(WITH_CACAO)" = "xno"; then \
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
	cp -r $(abs_top_srcdir)/overlays/openjdk/* openjdk/
if ENABLE_NIO2
	cp -r $(abs_top_srcdir)/overlays/nio2/openjdk/* openjdk/
endif
	touch stamps/overlay.stamp

#FIXME (clean): Missing clean-overlay

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
	rm -f stamps/extract-ecj.stamp
	rm -rf openjdk-ecj

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

# FIXME(clean): Missing clean-native-ecj

# bootstrap/ecj.
stamps/bootstrap-directory-ecj.stamp: stamps/native-ecj.stamp
	mkdir -p bootstrap/ecj/bin stamps/
	ln -sf $(JAVA) bootstrap/ecj/bin/java
	ln -sf $(JAVAH) bootstrap/ecj/bin/javah
	ln -sf $(RMIC) bootstrap/ecj/bin/rmic
	ln -sf $(JAR) bootstrap/ecj/bin/jar
	ln -sf ../../../javac bootstrap/ecj/bin/javac
	ln -sf ../../../javap bootstrap/ecj/bin/javap
	mkdir -p bootstrap/ecj/lib/endorsed
	ln -sf $(XALAN2_JAR) bootstrap/ecj/lib/endorsed/xalan-j2.jar
	ln -sf $(XALAN2_SERIALIZER_JAR) \
	  bootstrap/ecj/lib/endorsed/xalan-j2-serializer.jar
	ln -sf $(XERCES2_JAR) bootstrap/ecj/lib/endorsed/xerces-j2.jar
	mkdir -p bootstrap/ecj/jre/lib; \
	ln -sf $(SYSTEM_JDK_DIR)/jre/lib/$(JRE_ARCH_DIR) \
	  bootstrap/ecj/jre/lib/; \
	if ! test -d bootstrap/ecj/jre/lib/$(INSTALL_ARCH_DIR); \
	  then \
	  ln -sf ./$(JRE_ARCH_DIR) \
	    bootstrap/ecj/jre/lib/$(INSTALL_ARCH_DIR); \
	fi; \
	mkdir -p bootstrap/ecj/include; \
	for i in $(SYSTEM_JDK_DIR)/include/*; do \
	  test -r $$i | continue; \
	  i=`basename $$i`; \
	  rm -f bootstrap/ecj/include/$$i; \
	  ln -s $(SYSTEM_JDK_DIR)/include/$$i bootstrap/ecj/include/$$i; \
	done; \
	cp $(SYSTEM_JDK_DIR)/jre/lib/rt.jar \
	  $(abs_top_builddir)/bootstrap/ecj/jre/lib/rt.jar;
# For HotSpot
	mkdir -p $(abs_top_builddir)/bootstrap/ecj/lib ; \
	ln -sf $(abs_top_builddir)/bootstrap/ecj/jre/lib/rt.jar \
	  $(abs_top_builddir)/bootstrap/ecj/lib/tools.jar ; \
	mkdir -p stamps
	touch stamps/bootstrap-directory-ecj.stamp

clean-bootstrap-directory-ecj:
	rm -f stamps/bootstrap-directory-ecj.stamp
	rm -rf bootstrap/ecj

# bootstrap/icedtea.
stamps/bootstrap-directory.stamp: stamps/icedtea-against-ecj.stamp
	rm -rf bootstrap/icedtea
	ln -s \
	  $(abs_top_builddir)/$(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/ \
	  bootstrap/icedtea
	if ! test -d bootstrap/icedtea/include; then \
	  ln -sf $(ICEDTEA_BUILD_DIR_ECJ)/include bootstrap/icedtea/include; \
	fi
	mkdir -p stamps
	touch stamps/bootstrap-directory.stamp

clean-bootstrap-directory:
	rm -f stamps/bootstrap-directory.stamp
	rm -rf bootstrap/icedtea

# bootstrap/jdk1.6.0 to bootstrap/ecj symlink.
stamps/bootstrap-directory-symlink-ecj.stamp: \
	stamps/bootstrap-directory-ecj.stamp
	rm -f bootstrap/jdk1.6.0
	ln -sf ecj bootstrap/jdk1.6.0
	mkdir -p stamps
	touch stamps/bootstrap-directory-symlink-ecj.stamp

clean-bootstrap-directory-symlink-ecj:
	rm -f stamps/bootstrap-directory-symlink-ecj.stamp
	rm -f bootstrap/jdk1.6.0

# bootstrap/jdk1.6.0 to bootstrap/icedtea symlink.
stamps/bootstrap-directory-symlink.stamp: $(BOOTSTRAP_DIRECTORY_STAMP)
	mkdir -p bootstrap
	rm -f bootstrap/jdk1.6.0
	ln -sf $(ICEDTEA_HOME) bootstrap/jdk1.6.0; \
	if ! bootstrap/jdk1.6.0/bin/java -version ; \
         then \
           echo "bootstrap/jdk1.6.0/bin/java" \
               "cannot be found or is corrupted." ; \
           exit 1; \
        fi
	mkdir -p stamps
	touch stamps/bootstrap-directory-symlink.stamp

clean-bootstrap-directory-symlink:
	rm -f stamps/bootstrap-directory-symlink.stamp
	rm -f bootstrap/jdk1.6.0

# OpenJDK Targets
# ===============

# If you change anything here in the icedtea target, please make sure
# you change it in the icedtea-debug target as well.
stamps/icedtea.stamp: stamps/bootstrap-directory-symlink.stamp \
	stamps/netx-dist.stamp $(OPENJDK_TREE) stamps/plugin.stamp \
	extra-lib/about.jar stamps/cacao.stamp \
	stamps/visualvm.stamp $(PULSE_JAVA_TARGET) stamps/rewrite-rhino.stamp
	$(ARCH_PREFIX) $(MAKE) \
	  $(ICEDTEA_ENV) \
	  -C openjdk \
	  $(ICEDTEA_BUILD_TARGET)
	mkdir -p $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
	mkdir -p $(BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)
	mkdir -p $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/ext
	mkdir -p $(BUILD_OUTPUT_DIR)/j2re-image/lib/ext
if ENABLE_PLUGIN
	cp -pPRf $(PLUGIN_DIR)/IcedTeaPlugin.so \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
	cp -pPRf $(PLUGIN_DIR)/IcedTeaPlugin.so \
	  $(BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)
endif
if ENABLE_PULSE_JAVA
	cp -pPRf $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
	cp -pPRf $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so \
	  $(BUILD_OUTPUT_DIR)/j2re-image/lib/$(INSTALL_ARCH_DIR)
	cp -pPRf pulse-java.jar \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/ext
	cp -pPRf pulse-java.jar \
	  $(BUILD_OUTPUT_DIR)/j2re-image/lib/ext
endif
if WITH_VISUALVM
	mkdir -p $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/etc ; \
	mkdir -p $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/visualvm ; \
	sed "s/APPNAME=\`basename.*\`/APPNAME=visualvm/" \
	  visualvm/launcher/visualvm >> \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/bin/jvisualvm ; \
	chmod a+x $(BUILD_OUTPUT_DIR)/j2sdk-image/bin/jvisualvm ; \
	cp visualvm/launcher/visualvm.conf \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/etc ; \
	echo visualvm >> \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/etc/visualvm.clusters ; \
	echo profiler3 >> \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/etc/visualvm.clusters ; \
	cp -r visualvm/build/cluster/* \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/visualvm ; \
	cp -r netbeans/nbbuild/netbeans_visualvm/$(NB_PLATFORM) \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm ; \
	cp -r netbeans/nbbuild/netbeans_visualvm/profiler3 \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm	
endif
	cp $(NETX_RESOURCE_DIR)/about.jnlp extra-lib/about.jar \
	  $(BUILD_OUTPUT_DIR)/j2re-image/lib ; \
	cp $(NETX_RESOURCE_DIR)/about.jnlp extra-lib/about.jar \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib
if ZERO_BUILD
	printf -- '-zero ALIASED_TO -server\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
if SHARK_BUILD
	printf -- '-shark ALIASED_TO -server\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
if WITH_CACAO
	printf -- '-cacao ALIASED_TO -server\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
if ENABLE_SYSTEMTAP
	mkdir -p $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset ; \
	grep "client IGNORE" $(BUILD_JRE_ARCH_DIR)/jvm.cfg; \
	if test $$? -eq 0; then \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot.stp \
	    > $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot.stp; \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot_jni.stp \
	    > $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_jni.stp; \
	else \
	  cp $(abs_top_builddir)/tapset/hotspot.stp \
	    $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot.stp; \
	  cp $(abs_top_builddir)/tapset/hotspot_jni.stp \
	    $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/hotspot_jni.stp; \
	fi; \
	cp $(abs_top_builddir)/tapset/jstack.stp \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/tapset/jstack.stp
endif
	cp $(abs_top_builddir)/nss.cfg \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/security;
if WITH_TZDATA_DIR
	cp $(abs_top_builddir)/tz.properties \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib;
endif
	@echo "IcedTea is served:" $(BUILD_OUTPUT_DIR)
	mkdir -p stamps
	touch stamps/icedtea.stamp

stamps/icedtea-debug.stamp: stamps/bootstrap-directory-symlink.stamp \
	stamps/netx-dist.stamp $(OPENJDK_TREE) stamps/plugin.stamp \
	extra-lib/about.jar stamps/cacao.stamp \
	stamps/visualvm.stamp $(PULSE_JAVA_TARGET) stamps/rewrite-rhino.stamp
	$(ARCH_PREFIX) $(MAKE) \
	  $(ICEDTEA_ENV) \
	  -C openjdk \
	  $(ICEDTEA_DEBUG_BUILD_TARGET)
	mkdir -p $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
	mkdir -p $(BUILD_OUTPUT_DIR)-debug/j2re-image/lib/$(INSTALL_ARCH_DIR)
	mkdir -p $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/jre/lib/ext
	mkdir -p $(BUILD_OUTPUT_DIR)-debug/j2re-image/lib/ext
if ENABLE_PLUGIN
	cp -pPRf $(PLUGIN_DIR)/IcedTeaPlugin.so \
	  $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
	cp -pPRf $(PLUGIN_DIR)/IcedTeaPlugin.so \
	  $(BUILD_OUTPUT_DIR)-debug/j2re-image/lib/$(INSTALL_ARCH_DIR)
endif
if ENABLE_PULSE_JAVA
	cp -pPRf $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so \
	  $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)
	cp -pPRf $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so \
	  $(BUILD_OUTPUT_DIR)-debug/j2re-image/lib/$(INSTALL_ARCH_DIR)
	cp -pPRf pulse-java.jar \
	  $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/jre/lib/ext
	cp -pPRf pulse-java.jar \
	  $(BUILD_OUTPUT_DIR)-debug/j2re-image/lib/ext
endif
if WITH_VISUALVM 
	mkdir -p $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/etc ; \
	mkdir -p $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/visualvm ; \
	sed "s/APPNAME=\`basename.*\`/APPNAME=visualvm/" \
	  visualvm/launcher/visualvm >> \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/bin/jvisualvm ; \
	chmod a+x $(BUILD_OUTPUT_DIR)/j2sdk-image/bin/jvisualvm ; \
	cp visualvm/launcher/visualvm.conf \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/etc ; \
	echo visualvm >> \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/etc/visualvm.clusters ; \
	echo profiler3 >> \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/etc/visualvm.clusters ; \
	cp -r visualvm/build/cluster/* \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm/visualvm ; \
	cp -r netbeans/nbbuild/netbeans_visualvm/$(NB_PLATFORM) \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm ; \
	cp -r netbeans/nbbuild/netbeans_visualvm/profiler3 \
	  $(BUILD_OUTPUT_DIR)/j2sdk-image/lib/visualvm
endif
	cp $(NETX_RESOURCE_DIR)/default.jnlp extra-lib/about.jar \
	  $(BUILD_OUTPUT_DIR)-debug/j2re-image/lib ; \
	cp $(NETX_RESOURCE_DIR)/default.jnlp extra-lib/about.jar \
	  $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/jre/lib
if ZERO_BUILD
	printf -- '-zero ALIASED_TO -server\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
if SHARK_BUILD
	printf -- '-shark ALIASED_TO -server\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
if WITH_CACAO
	printf -- '-cacao ALIASED_TO -server\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
if ENABLE_SYSTEMTAP
	mkdir -p $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/tapset ; \
	grep "client IGNORE" $(BUILD_JRE_ARCH_DIR)/jvm.cfg; \
	if test $$? -eq 0; then \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot.stp \
	    > $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/tapset/hotspot.stp; \
	  sed -e '/\/client\/libjvm.so/d' \
	    < $(abs_top_builddir)/tapset/hotspot_jni.stp \
	    > $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/tapset/hotspot_jni.stp; \
	else \
	  cp $(abs_top_builddir)/tapset/hotspot.stp \
	    $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/tapset/hotspot.stp; \
	  cp $(abs_top_builddir)/tapset/hotspot_jni.stp \
	    $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/tapset/hotspot_jni.stp; \
	fi; \
	cp $(abs_top_builddir)/tapset/jstack.stp \
	  $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/tapset/jstack.stp
endif
	cp $(abs_top_builddir)/nss.cfg \
	  $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/jre/lib/security;
if WITH_TZDATA_DIR
	cp $(abs_top_builddir)/tz.properties \
	  $(BUILD_OUTPUT_DIR)-debug/j2sdk-image/jre/lib;
endif
	@echo "IcedTea (debug build) is served:" \
	  $(BUILD_OUTPUT_DIR)-debug
	mkdir -p stamps
	touch stamps/icedtea-debug.stamp

clean-icedtea: stamps/extract.stamp
	$(ARCH_PREFIX) $(MAKE) \
	  $(ICEDTEA_ENV) \
	  -C openjdk clobber
	rm -f stamps/icedtea.stamp stamps/icedtea-debug.stamp

stamps/icedtea-against-icedtea.stamp: stamps/bootstrap-directory-symlink.stamp \
 stamps/icedtea.stamp stamps/add-cacao.stamp stamps/add-zero.stamp
	mkdir -p stamps
	touch stamps/icedtea-against-icedtea.stamp

#FIXME (clean): Missing clean-icedtea-against-icedtea

stamps/icedtea-debug-against-icedtea.stamp: stamps/bootstrap-directory-symlink.stamp \
 stamps/icedtea-debug.stamp stamps/add-cacao-debug.stamp stamps/add-zero-debug.stamp
	mkdir -p stamps
	touch stamps/icedtea-debug-against-icedtea.stamp

#FIXME (clean): Missing clean-icedtea-debug-against-icedtea

# OpenJDK ecj Targets
# ===================

stamps/icedtea-ecj.stamp: stamps/bootstrap-directory-symlink-ecj.stamp \
	stamps/netx-dist.stamp $(OPENJDK_ECJ_TREE) stamps/cacao.stamp \
	stamps/rewrite-rhino.stamp stamps/plugin.stamp
	$(ARCH_PREFIX) $(MAKE) \
	  $(ICEDTEA_ENV_ECJ) \
	  -C openjdk-ecj/ \
	  $(ICEDTEA_BUILD_TARGET)
	@echo "ecj-poured IcedTea is served:" \
	  $(ECJ_BUILD_OUTPUT_DIR)
	mkdir -p stamps
	touch stamps/icedtea-ecj.stamp

hotspot:
if WITH_OPENJDK
	rm -f stamps/icedtea.stamp
	rm -f stamps/icedtea-against-icedtea.stamp
	$(ARCH_PREFIX) $(MAKE) ICEDTEA_BUILD_TARGET=hotspot icedtea-against-icedtea
	mkdir -p \
	   $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/server
	cp $(BUILD_OUTPUT_DIR)/$(SERVER_DIR)/libjvm.so \
	   $(BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/server
	@echo "Hotspot is served:" $(BUILD_OUTPUT_DIR)/j2sdk-image
else
	rm -f stamps/icedtea-ecj.stamp
	rm -f stamps/icedtea-against-ecj.stamp
	$(ARCH_PREFIX) $(MAKE) ICEDTEA_BUILD_TARGET=hotspot icedtea-against-ecj
	mkdir -p \
	   $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/server
	cp $(ECJ_BUILD_OUTPUT_DIR)/$(SERVER_DIR)/libjvm.so \
	   $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image/jre/lib/$(INSTALL_ARCH_DIR)/server
	@echo "Hotspot is served:" $(ECJ_BUILD_OUTPUT_DIR)/j2sdk-image
endif

clean-icedtea-ecj: stamps/extract-ecj.stamp
	rm -f stamps/icedtea-ecj.stamp
	$(ARCH_PREFIX) $(MAKE) \
	  $(ICEDTEA_ENV_ECJ) \
	  -C openjdk-ecj/ clobber

stamps/icedtea-against-ecj.stamp: \
	stamps/bootstrap-directory-symlink-ecj.stamp \
	stamps/icedtea-ecj.stamp
	mkdir -p stamps
	touch stamps/icedtea-against-ecj.stamp

#FIXME (clean): Missing clean-icedtea-against-ecj

# Plugin

if ENABLE_PLUGIN
# IcedTeaPlugin.so.
# Separate compile and link invocations to ensure intermediate object
# is listed before -l options.  See:
# http://developer.mozilla.org/en/docs/XPCOM_Glue

PLUGIN_SRC=IcedTeaNPPlugin.cc IcedTeaScriptablePluginObject.cc \
        IcedTeaJavaRequestProcessor.cc IcedTeaPluginRequestProcessor.cc \
		IcedTeaPluginUtils.cc

PLUGIN_OBJECTS=IcedTeaNPPlugin.o IcedTeaScriptablePluginObject.o \
        IcedTeaJavaRequestProcessor.o IcedTeaPluginRequestProcessor.o \
		IcedTeaPluginUtils.o

$(PLUGIN_DIR)/%.o: $(PLUGIN_SRCDIR)/%.cc
	mkdir -p $(PLUGIN_DIR) && \
	cd $(PLUGIN_DIR) && \
	$(CXX) $(CXXFLAGS) \
	  -DJDK_UPDATE_VERSION="\"$(JDK_UPDATE_VERSION)\"" \
	  -DPLUGIN_VERSION="\"$(PLUGIN_VERSION)\"" \
	  -DMOZILLA_VERSION_COLLAPSED="$(MOZILLA_VERSION_COLLAPSED)" \
	  $(GLIB_CFLAGS) \
	  $(GTK_CFLAGS) \
	  $(MOZILLA_CFLAGS) \
	  -fPIC -o $@ -c $<

$(PLUGIN_DIR)/IcedTeaPlugin.so: $(addprefix $(PLUGIN_DIR)/,$(PLUGIN_OBJECTS))
	cd $(PLUGIN_DIR) && \
	$(CXX) $(CXXFLAGS) \
	  $(PLUGIN_OBJECTS) \
	  $(GLIB_LIBS) \
	  $(GTK_LIBS) \
	  $(MOZILLA_LIBS)\
	  -shared -o $@

clean-IcedTeaPlugin:
	rm -f $(PLUGIN_DIR)/*.o
	rm -f $(PLUGIN_DIR)/IcedTeaPlugin.so
endif

stamps/plugin.stamp: $(ICEDTEAPLUGIN_TARGET)
	mkdir -p stamps
	touch stamps/plugin.stamp

clean-plugin: $(ICEDTEAPLUGIN_CLEAN)
	rm -f stamps/plugin.stamp

liveconnect-source-files.txt:
	if test "x${LIVECONNECT_DIR}" != x; then \
	  find $(LIVECONNECT_SRCS) -name '*.java' | sort > $@ ; \
	fi
	touch $@

stamps/liveconnect.stamp: liveconnect-source-files.txt stamps/netx.stamp
	if test "x${LIVECONNECT_DIR}" != x; then \
	  mkdir -p $(abs_top_builddir)/liveconnect && \
	  $(ICEDTEA_BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) \
	      -d $(abs_top_builddir)/liveconnect \
	      -classpath $(abs_top_builddir)/netx.build:$(ICEDTEA_RT) \
	      -sourcepath $(SOURCEPATH_DIRS) \
	      -bootclasspath \'\' \
	      @liveconnect-source-files.txt ; \
	fi
	mkdir -p stamps
	touch $@

stamps/liveconnect-dist.stamp: stamps/liveconnect.stamp
	if test "x${LIVECONNECT_DIR}" != x; then \
	  (cd $(abs_top_builddir)/liveconnect ; \
	   mkdir -p lib ; \
	   $(ICEDTEA_BOOT_DIR)/bin/jar cf lib/classes.jar $(LIVECONNECT_DIR) ; \
	   cp -a $(LIVECONNECT_SRCS) src; \
	   find src -type f -exec chmod 640 '{}' ';' -o -type d -exec chmod 750 '{}' ';'; \
	   cd src ; \
	   $(ZIP) -qr $(abs_top_builddir)/liveconnect/lib/src.zip $(LIVECONNECT_DIR) ) ; \
	fi
	mkdir -p stamps
	touch $@

clean-liveconnect:
	rm -rf $(abs_top_builddir)/liveconnect
	rm -f stamps/liveconnect-dist.stamp
	rm -f liveconnect-source-files.txt
	rm -f stamps/liveconnect.stamp

# NetX
# requires availability of OpenJDK source code including
# a patch applied to sun.plugin.AppletViewerPanel and generated sources

netx-source-files.txt:
	find $(NETX_SRCDIR) -name '*.java' | sort > $@

stamps/netx.stamp: netx-source-files.txt stamps/rt-class-files.stamp
	mkdir -p $(abs_top_builddir)/netx.build
	$(ICEDTEA_BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) \
	    -d $(abs_top_builddir)/netx.build \
	    -sourcepath $(NETX_SRCDIR):$(SOURCEPATH_DIRS) \
	    -classpath $(ICEDTEA_RT) -bootclasspath \'\' \
	    @netx-source-files.txt
	cp -r $(NETX_RESOURCE_DIR) $(abs_top_builddir)/netx.build/net/sourceforge/jnlp
	mkdir -p stamps
	touch $@

stamps/netx-dist.stamp: stamps/netx.stamp
	(cd $(abs_top_builddir)/netx.build ; \
	 mkdir -p lib ; \
	 $(ICEDTEA_BOOT_DIR)/bin/jar cf lib/classes.jar javax/jnlp net ; \
	 cp -a $(NETX_SRCDIR) src; \
	 find src -type f -exec chmod 640 '{}' ';' -o -type d -exec chmod 750 '{}' ';'; \
	 cd src ; \
	 $(ICEDTEA_BOOT_DIR)/bin/jar uf $(abs_top_builddir)/netx.build/lib/classes.jar \
	  `find . -type f -not -name '*.java'` ; \
	 $(ZIP) -qr $(abs_top_builddir)/netx.build/lib/src.zip javax net )
	mkdir -p stamps
	touch $@

clean-netx:
	rm -rf $(abs_top_builddir)/netx.build
	rm -f stamps/netx-dist.stamp
	rm -f netx-source-files.txt
	rm -f stamps/netx.stamp

# extras -- used to create about.jar for javaws.
extra-source-files.txt:
	find $(abs_top_srcdir)/extra -name '*.java' | sort > $@

stamps/extra-class-files.stamp: $(INITIAL_BOOTSTRAP_LINK_STAMP) \
  extra-source-files.txt stamps/netx.stamp
	mkdir -p extra-lib
	$(ICEDTEA_BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) -d extra-lib \
          -sourcepath extra -cp netx.build \
          -bootclasspath $(ICEDTEA_RT) @extra-source-files.txt
	cp -r $(NETX_EXTRA_DIR) extra-lib/net/sourceforge/jnlp/about
	mkdir -p stamps
	touch $@

clean-extra:
	rm -rf extra-lib
	rm -f stamps/extra-class-files.stamp
	rm -f extra-source-files.txt

extra-lib/about.jar: stamps/extra-class-files.stamp
	if ! test -d $(ICEDTEA_BOOT_DIR) ; \
	then \
	  $(JAR) cf $@ -C extra-lib net ; \
	else \
	  $(ICEDTEA_BOOT_DIR)/bin/jar cf $@ -C extra-lib net ; \
	fi

# PulseAudio based mixer
# (pulse-java)

#FIXME (meta): Need pulse-java meta target

if ENABLE_PULSE_JAVA
$(PULSE_JAVA_NATIVE_BUILDDIR)/%.o: $(PULSE_JAVA_NATIVE_SRCDIR)/%.c stamps/pulse-java-headers.stamp
	$(CC) $(IT_CFLAGS) -fPIC -I$(ICEDTEA_BOOT_DIR)/include/linux -I$(ICEDTEA_BOOT_DIR)/include \
	 -I$(PULSE_JAVA_NATIVE_BUILDDIR) -o $@ -c $<

$(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so: $(PULSE_JAVA_NATIVE_OBJECTS)
	$(CC) $(LDFLAGS) -shared $(PULSE_JAVA_NATIVE_OBJECTS) $(LIBPULSE_LIBS) \
	 -o $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so

stamps/pulse-java.stamp: stamps/pulse-java-jar.stamp $(PULSE_JAVA_NATIVE_BUILDDIR)/libpulse-java.so
	mkdir -p stamps
	touch stamps/pulse-java.stamp

stamps/pulse-java-jar.stamp: stamps/pulse-java-class.stamp
	mkdir -p $(PULSE_JAVA_CLASS_DIR);
	$(ICEDTEA_BOOT_DIR)/bin/jar cf pulse-java.jar -C $(PULSE_JAVA_CLASS_DIR) .;
	mkdir -p stamps
	touch stamps/pulse-java-jar.stamp

stamps/pulse-java-class.stamp: $(INITIAL_BOOTSTRAP_LINK_STAMP)
	mkdir -p $(PULSE_JAVA_CLASS_DIR)
	(cd $(PULSE_JAVA_JAVA_SRCDIR); \
	 $(ICEDTEA_BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) -d $(PULSE_JAVA_CLASS_DIR) \
	  -bootclasspath $(ICEDTEA_RT) \
	  org/classpath/icedtea/pulseaudio/*.java \
	)
	cp -r $(PULSE_JAVA_JAVA_SRCDIR)/META-INF $(PULSE_JAVA_CLASS_DIR)
	chmod -R ug+w $(PULSE_JAVA_CLASS_DIR)/META-INF
	mkdir -p stamps
	touch stamps/pulse-java-class.stamp

stamps/pulse-java-headers.stamp: stamps/pulse-java-class.stamp
	mkdir -p $(PULSE_JAVA_NATIVE_BUILDDIR)
	$(ICEDTEA_BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  org.classpath.icedtea.pulseaudio.EventLoop ; \
	$(ICEDTEA_BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  org.classpath.icedtea.pulseaudio.Stream ; \
	$(ICEDTEA_BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  org.classpath.icedtea.pulseaudio.Operation; \
	$(ICEDTEA_BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  org.classpath.icedtea.pulseaudio.PulseAudioSourcePort ; \
	$(ICEDTEA_BOOT_DIR)/bin/javah -d $(PULSE_JAVA_NATIVE_BUILDDIR) -classpath $(PULSE_JAVA_CLASS_DIR) \
	  org.classpath.icedtea.pulseaudio.PulseAudioTargetPort ; \
	mkdir -p stamps
	touch stamps/pulse-java-headers.stamp

clean-pulse-java:
	[ -z "$(PULSE_JAVA_NATIVE_BUILDDIR)" ] || rm -rf $(PULSE_JAVA_NATIVE_BUILDDIR)
	[ -z "$(PULSE_JAVA_CLASS_DIR)" ] || rm -rf $(PULSE_JAVA_CLASS_DIR)
	rm -f stamps/pulse-java*.stamp
	rm -f pulse-java.jar
endif

# end of pulse-java

# Rhino support

stamps/rewriter.stamp: $(INITIAL_BOOTSTRAP_LINK_STAMP)
if WITH_RHINO
	mkdir -p $(abs_top_builddir)/rewriter
	(cd $(abs_top_srcdir)/rewriter ; \
	 $(ICEDTEA_BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) \
	 -d $(abs_top_builddir)/rewriter $(REWRITER_SRCS) \
	)
endif
	mkdir -p stamps
	touch stamps/rewriter.stamp

stamps/rewrite-rhino.stamp: stamps/rewriter.stamp $(RHINO_JAR)
if WITH_RHINO
	mkdir -p rhino/rhino.{old,new}
	(cd rhino/rhino.old ; jar xf $(RHINO_JAR))
	$(ICEDTEA_BOOT_DIR)/bin/java -cp $(abs_top_builddir)/rewriter \
	  com.redhat.rewriter.ClassRewriter \
	  $(abs_top_builddir)/rhino/rhino.old $(abs_top_builddir)/rhino/rhino.new \
	  org.mozilla sun.org.mozilla
	(cd rhino/rhino.old ; \
	 for files in `find -type f -not -name '*.class'` ; do \
	   new_file=../rhino.new/`echo $$files|sed -e 's#org#sun/org#'` ; \
	   mkdir -p `dirname $$new_file` ; \
	   cp -v $$files $$new_file ; \
	   sed -ie 's#org\.mozilla#sun.org.mozilla#g' $$new_file ; \
	 done \
	)
	(cd rhino/rhino.new ; \
	$(ICEDTEA_BOOT_DIR)/bin/jar cfm ../rhino.jar META-INF/MANIFEST.MF sun )
endif
	mkdir -p stamps
	touch stamps/rewrite-rhino.stamp

# VisualVM

stamps/nbplatform.stamp: $(INITIAL_BOOTSTRAP_LINK_STAMP) stamps/extract.stamp
if WITH_VISUALVM
	cd netbeans ; \
        rm nbbuild/external/binaries-list ; \
	mkdir -p ./nbbuild/netbeans_visualvm/ ; \
	ln -s $(SYSTEM_NETBEANS_DIR)/$(NB_PLATFORM)/ ./nbbuild/netbeans_visualvm/$(NB_PLATFORM) ; \
	ln -s $(SYSTEM_NETBEANS_DIR)/$(NB_APISUPPORT)/ ./nbbuild/netbeans_visualvm/$(NB_APISUPPORT) ; \
	ln -s $(SYSTEM_NETBEANS_DIR)/harness/ ./nbbuild/netbeans_visualvm/harness ; \
	if ! (uname -a | grep x86_64) ; then \
	  mkdir -p lib.profiler/release/lib/deployed/jdk15/linux ; \
	  mkdir -p lib.profiler/release/lib/deployed/jdk16/linux ; \
	  buildscript=./buildnative-linux-15.sh ; \
	else \
	  mkdir -p lib.profiler/release/lib/deployed/jdk15/linux-amd64 ; \
	  mkdir -p lib.profiler/release/lib/deployed/jdk16/linux-amd64 ; \
	  buildscript=./buildnative-linux64-15.sh ; \
	fi ; \
	cd lib.profiler/native/build ; \
	JAVA_HOME_15=$(ICEDTEA_HOME) JAVA_HOME_16=$(ICEDTEA_HOME) \
	  $$buildscript ; \
	cd ../../.. ; \
        JAVA_HOME=$(ICEDTEA_HOME) $(ANT) -Dpermit.jdk6.builds=true \
            -f nbbuild/build.xml bootstrap ; \
	for dir in lib.profiler lib.profiler.ui lib.profiler.common profiler ; do \
	  JAVA_HOME=$(ICEDTEA_HOME) $(ANT) -Dpermit.jdk6.builds=true -Dbuildnumber=081204 \
            -Dnetbeans.dest.dir=../nbbuild/netbeans_visualvm \
	    -f $$dir/build.xml ; \
	done 
endif
	mkdir -p stamps
	touch $@

clean-nbplatform:
	rm -rf netbeans
	rm -f stamps/nbplatform.stamp

stamps/visualvm.stamp: $(BOOTSTRAP_DIRECTORY_STAMP) stamps/download.stamp \
	stamps/replace-hotspot.stamp stamps/nbplatform.stamp
if WITH_VISUALVM
	cd visualvm ; \
	ln -s $(abs_top_srcdir)/netbeans/nbbuild/netbeans_visualvm netbeans ; \
	JAVA_HOME=$(ICEDTEA_HOME) $(ANT) build
endif
	mkdir -p stamps
	touch $@

clean-visualvm:
	rm -rf visualvm
	rm -f stamps/visualvm.stamp

# CACAO

stamps/cacao.stamp: $(OPENJDK_TREE) stamps/rt.stamp
if BUILD_CACAO
if !USE_SYSTEM_CACAO
	cd cacao/cacao && \
	$(ARCH_PREFIX) ./configure \
	  --host=$(host_alias) \
	  --build=$(build_alias) \
	  --target=$(target_alias) \
	  --prefix=$(abs_top_builddir)/cacao/install \
	  --with-java-runtime-library=openjdk \
	  --with-java-runtime-library-prefix=$(abs_top_builddir)/openjdk \
	  --with-java-runtime-library-classes=$(ICEDTEA_RT) \
	  --enable-jre-layout $(CACAO_CONFIGURE_ARGS); \
	$(ARCH_PREFIX) $(MAKE) install
	ln -s server $(abs_top_builddir)/cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/client
endif
endif
	mkdir -p stamps
	touch $@

clean-cacao:
	rm -rf cacao
	rm -f stamps/cacao.stamp

# targets for additional VMs

stamps/add-cacao.stamp: stamps/icedtea.stamp stamps/cacao.stamp
if ADD_CACAO_BUILD
	mkdir -p $(BUILD_JRE_ARCH_DIR)/cacao
	install -m 644 cacao/install/lib/libjvm.so \
		$(BUILD_JRE_ARCH_DIR)/cacao/
	install -m 644 cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/server/libjsig.so \
		$(BUILD_JRE_ARCH_DIR)/cacao/
	install -m 644 cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/server/Xusage.txt \
		$(BUILD_JRE_ARCH_DIR)/cacao/
	printf -- '-cacao KNOWN\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
else
	printf -- '-cacao ERROR\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
	touch $@

#FIXME (clean): Missing clean-add-cacao

stamps/add-cacao-debug.stamp: stamps/icedtea-debug.stamp stamps/cacao.stamp
if ADD_CACAO_BUILD
	mkdir -p $(BUILD_DEBUG_JRE_ARCH_DIR)/cacao
	install -m 644 cacao/install/lib/libjvm.so \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/cacao/
	install -m 644 cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/server/libjsig.so \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/cacao/
	install -m 644 cacao/install/jre/lib/$(INSTALL_ARCH_DIR)/server/Xusage.txt \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/cacao/
	printf -- '-cacao KNOWN\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
else
	printf -- '-cacao ERROR\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
	touch $@

#FIXME (clean): Missing clean-add-cacao-debug

# configure script arguments, quoted in single quotes
CONFIGURE_ARGS = @CONFIGURE_ARGS@
ADD_ZERO_CONFIGURE_ARGS = \
	--with-openjdk=$(abs_top_builddir)/$(BUILD_OUTPUT_DIR)/j2sdk-image \
	--enable-zero
if ADD_SHARK_BUILD
ADD_ZERO_CONFIGURE_ARGS += \
	--enable-shark
endif
ADD_ZERO_CONFIGURE_ARGS += \
	--disable-docs \
	$(filter-out '--with-gcj-home=% '--with-ecj=% \
			'--with-java=% '--with-javah=% \
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

ADD_ZERO_EXTRA_BUILD_ENV = \
	BUILD_LANGTOOLS=false ALT_LANGTOOLS_DIST=$(ICEDTEA_BUILD_DIR)/langtools/dist \
	BUILD_JAXP=false      ALT_JAXP_DIST=$(ICEDTEA_BUILD_DIR)/jaxp/dist \
	BUILD_JAXWS=false     ALT_JAXWS_DIST=$(ICEDTEA_BUILD_DIR)/jaxws/dist \
	BUILD_CORBA=false     ALT_CORBA_DIST=$(ICEDTEA_BUILD_DIR)/corba/dist \
	BUILD_JDK=false \
	DISTRIBUTION_PATCHES='$(foreach p,$(DISTRIBUTION_PATCHES),$(if $(findstring cacao,$(p)),,$(p)))'

stamps/add-zero.stamp: stamps/icedtea.stamp
if ADD_ZERO_BUILD
	mkdir -p zerovm

	cd zerovm && \
	    $(ADD_ZERO_EXTRA_BUILD_ENV) \
		$(ARCH_PREFIX) $(abs_top_srcdir)/configure $(ADD_ZERO_CONFIGURE_ARGS)

	$(ADD_ZERO_EXTRA_BUILD_ENV) \
		$(ARCH_PREFIX) $(MAKE) -C zerovm $(ICEDTEA_BUILD_TARGET)

if ZERO_BUILD
	mkdir -p $(BUILD_JRE_ARCH_DIR)/shark
	cp -a zerovm/openjdk/build/$(OS_DIR)/hotspot/import/jre/lib/$(INSTALL_ARCH_DIR)/server/* \
		$(BUILD_JRE_ARCH_DIR)/shark/
	printf -- '-shark KNOWN\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
else
	mkdir -p $(BUILD_JRE_ARCH_DIR)/zero
	cp -a zerovm/openjdk/build/$(OS_DIR)/hotspot/import/jre/lib/$(INSTALL_ARCH_DIR)/server/* \
		$(BUILD_JRE_ARCH_DIR)/zero/
	printf -- '-zero KNOWN\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
else
	printf -- '-zero ERROR\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
	printf -- '-shark ERROR\n' >> $(BUILD_JRE_ARCH_DIR)/jvm.cfg
endif
	touch $@

#FIXME (clean): Missing clean-add-zero

stamps/add-zero-debug.stamp: stamps/icedtea-debug.stamp
if ADD_ZERO_BUILD
	mkdir -p zerovm

	cd zerovm && \
	    $(ADD_ZERO_EXTRA_BUILD_ENV) \
		$(ARCH_PREFIX) $(abs_top_srcdir)/configure $(ADD_ZERO_CONFIGURE_ARGS)

	$(ADD_ZERO_EXTRA_BUILD_ENV) \
		$(ARCH_PREFIX) $(MAKE) -C zerovm $(ICEDTEA_DEBUG_BUILD_TARGET)

if ZERO_BUILD
	mkdir -p $(BUILD_DEBUG_JRE_ARCH_DIR)/shark
	cp -a zerovm/openjdk/build/$(OS_DIR)/hotspot/import/jre/lib/$(INSTALL_ARCH_DIR)/server/* \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/shark/
	printf -- '-shark KNOWN\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
else
	mkdir -p $(BUILD_DEBUG_JRE_ARCH_DIR)/zero
	cp -a zerovm/openjdk/build/$(OS_DIR)/hotspot/import/jre/lib/$(INSTALL_ARCH_DIR)/server/* \
		$(BUILD_DEBUG_JRE_ARCH_DIR)/zero/
	printf -- '-zero KNOWN\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
else
	printf -- '-zero ERROR\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
	printf -- '-shark ERROR\n' >> $(BUILD_DEBUG_JRE_ARCH_DIR)/jvm.cfg
endif
	touch $@

#FIXME (clean): Missing clean-add-zero-debug

# end additional VMs

# plugin tests

if ENABLE_PLUGIN
stamps/plugin-tests.stamp: $(INITIAL_BOOTSTRAP_LINK_STAMP) $(PLUGIN_TEST_SRCS) \
 stamps/plugin.stamp
	mkdir -p plugin/tests/LiveConnect
	$(ICEDTEA_BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) \
	 -d plugin/tests/LiveConnect \
	 -classpath liveconnect/lib/classes.jar \
	 $(PLUGIN_TEST_SRCS) ;
	$(ICEDTEA_BOOT_DIR)/bin/jar cf plugin/tests/LiveConnect/PluginTest.jar \
	  plugin/tests/LiveConnect/*.class ;
	cp -a $(abs_top_srcdir)/plugin/tests/LiveConnect/*.{js,html} plugin/tests/LiveConnect ;
	echo "Done. Now launch \"firefox file://`pwd`/index.html\"" ; \
	mkdir -p stamps
	touch stamps/plugin-tests.stamp
endif

# jtreg

stamps/jtreg.stamp: stamps/icedtea-against-icedtea.stamp
	rm -rf test/jtreg/classes
	mkdir -p test/jtreg/classes
	$(ICEDTEA_BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) -d test/jtreg/classes \
	   -encoding iso-8859-1 `find $(abs_top_srcdir)/test/jtreg/com -name '*.java'`
	(cd $(abs_top_srcdir)/test/jtreg; \
	 $(ICEDTEA_BOOT_DIR)/bin/jar cfm $(abs_top_builddir)/test/jtreg.jar \
	   META-INF/MANIFEST.MF \
	   legal  README JavaTest.cmdMgrs.lst JavaTest.toolMgrs.lst \
	   `find com -type f -a -not -name '*.java'` \
	   -C $(abs_top_builddir)/test/jtreg/classes com)
	mkdir -p stamps
	touch $@

clean-jtreg:
	rm -rf test/jtreg/classes
	rm -f test/jtreg.jar
	rm -f stamps/jtreg.stamp

check-hotspot: stamps/jtreg.stamp
	mkdir -p test/hotspot/JTwork test/hotspot/JTreport
	$(ICEDTEA_BOOT_DIR)/bin/java -jar test/jtreg.jar -v1 -a -ignore:quiet \
		-w:test/hotspot/JTwork -r:test/hotspot/JTreport \
		-jdk:`pwd`/$(BUILD_OUTPUT_DIR)/j2sdk-image \
		$(ICEDTEA_JTREG_OPTIONS) \
		`pwd`/openjdk/hotspot/test \
	    | tee test/$@.log

check-langtools: stamps/jtreg.stamp
	mkdir -p test/langtools/JTwork test/langtools/JTreport
	$(ICEDTEA_BOOT_DIR)/bin/java -jar test/jtreg.jar -v1 -a -ignore:quiet \
		-w:test/langtools/JTwork -r:test/langtools/JTreport \
		-s -jdk:`pwd`/$(BUILD_OUTPUT_DIR)/j2sdk-image \
		$(ICEDTEA_JTREG_OPTIONS) \
		`pwd`/openjdk/langtools/test \
	    | tee test/$@.log

check-jdk: stamps/jtreg.stamp
	mkdir -p test/jdk/JTwork test/jdk/JTreport
	$(ICEDTEA_BOOT_DIR)/bin/java -jar test/jtreg.jar -v1 -a -ignore:quiet \
		-w:test/jdk/JTwork -r:test/jdk/JTreport \
		-s -jdk:`pwd`/$(BUILD_OUTPUT_DIR)/j2sdk-image \
		-exclude:$(abs_top_srcdir)/test/jtreg/excludelist.jdk.jtx \
		$(ICEDTEA_JTREG_OPTIONS) \
		`pwd`/openjdk/jdk/test \
	    | tee test/$@.log

clean-jtreg-reports:
	rm -rf test/hotspot test/langtools test/jdk
	rm -f test/check-*.log test/jtreg-summary.log

# FIXME: this might need some adjustment for other OS than Linux
jtreg_processes = ps x -ww -o pid,ppid,args \
	| awk '$$2 == 1 && $$3 ~ /^$(subst /,\/,/scratch)/' \
	| sed 's,$(CURDIR)/$(sdkimg),<sdkimg>,g;s,$(CURDIR),<pwd>,g'
jtreg_pids = ps x --no-headers -ww -o pid,ppid,args \
	| awk '$$2 == 1 && $$3 ~ /^$(subst /,\/,$(CURDIR)/$(sdkimg))/ {print $$1}'

jtregcheck: jtreg check-hotspot check-langtools check-jdk
	for i in hotspot langtools jdk; do \
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

# Support classes for non-OpenJDK bootstraps

# rt.jar additional class files.
rt-source-files.txt: $(OPENJDK_ECJ_TREE)
	for dir in $(ICEDTEA_BOOTSTRAP_DIRS) ; \
	do \
	  $(FIND) $(abs_top_builddir)/$$dir -name '*.java' >> $@; \
	done
	for files in $(ICEDTEA_BOOTSTRAP_CLASSES) ; \
	do \
	  echo $$files >> $@ ; \
	done

stamps/rt-class-files.stamp: $(INITIAL_BOOTSTRAP_LINK_STAMP) rt-source-files.txt
	mkdir -p lib/rt
	$(ICEDTEA_BOOT_DIR)/bin/javac $(IT_JAVACFLAGS) -d lib/rt \
          -sourcepath $(SOURCEPATH_DIRS) -bootclasspath \'\' \
          -classpath $(SYSTEM_JDK_DIR)/jre/lib/rt.jar \
	  @rt-source-files.txt ;
	mkdir -p stamps
	touch stamps/rt-class-files.stamp

clean-rt:
	rm -rf lib/rt
	rm -f stamps/rt-class-files.stamp
	rm -f stamps/rt.stamp
	rm -f rt-source-files.txt
	cp $(SYSTEM_JDK_DIR)/jre/lib/rt.jar $(ICEDTEA_RT)

stamps/rt.stamp: stamps/rt-class-files.stamp stamps/bootstrap-directory-ecj.stamp \
 stamps/liveconnect.stamp
	mkdir -p stamps
if LACKS_SUN_AWT_TOOLKIT
	$(ICEDTEA_BOOT_DIR)/bin/jar uf $(ICEDTEA_RT) -C lib/rt com -C lib/rt java \
	  -C lib/rt javax -C lib/rt sun 
if ENABLE_NIO2
	if [ -e lib/rt/org/classpath ] ; then \
	    $(ICEDTEA_BOOT_DIR)/bin/jar uf $(ICEDTEA_RT) -C lib/rt org/classpath ; \
	fi
endif
endif
	touch stamps/rt.stamp

# Target Aliases
# ===============

bootstrap-directory-ecj: stamps/bootstrap-directory-ecj.stamp

bootstrap-directory: stamps/bootstrap-directory.stamp

bootstrap-directory-symlink-ecj: stamps/bootstrap-directory-symlink-ecj.stamp

bootstrap-directory-symlink: stamps/bootstrap-directory-symlink.stamp

cacao: stamps/cacao.stamp

clean: distclean-local

nbplatform: stamps/nbplatform.stamp

download: stamps/download.stamp

download-drops: stamps/download-drops.stamp

download-jaf-drop: stamps/download-jaf-drop.stamp

download-jaxp-drop: stamps/download-jaxp-drop.stamp

download-jaxws-drop: stamps/download-jaxws-drop.stamp

extract: stamps/extract.stamp

extract-ecj: stamps/extract-ecj.stamp

hotspot-ports: stamps/ports.stamp

icedtea: stamps/icedtea.stamp

icedtea-against-icedtea: stamps/icedtea-against-icedtea.stamp

icedtea-against-ecj: stamps/icedtea-against-ecj.stamp

icedtea-debug: stamps/icedtea-debug.stamp

icedtea-debug-against-icedtea: stamps/icedtea-debug-against-icedtea.stamp

icedtea-ecj: stamps/icedtea-ecj.stamp

jtreg: stamps/jtreg.stamp

liveconnect: stamps/liveconnect.stamp

liveconnect-dist: stamps/liveconnect-dist.stamp

native-ecj: stamps/native-ecj.stamp

netx: stamps/netx.stamp

netx-dist: stamps/netx-dist.stamp

overlay: stamps/overlay.stamp

patch: stamps/patch.stamp

patch-ecj: stamps/patch-ecj.stamp

patch-fsg: stamps/patch-fsg.stamp

plugin: stamps/plugin.stamp

plugin-tests: stamps/plugin-tests.stamp

pulse-java: stamps/pulse-java.stamp

rewriter: stamps/rewriter.stamp

rewrite-rhino: stamps/rewrite-rhino.stamp

replace-hotspot: stamps/replace-hotspot.stamp

rt-jar: stamps/rt.stamp

rt-class-files: stamps/rt-class-files.stamp

tools-jar: stamps/tools.stamp

visualvm: stamps/visualvm.stamp
