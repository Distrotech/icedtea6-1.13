AC_DEFUN([IT_SET_ARCH_SETTINGS],
[
  case "${target_cpu}" in
    x86_64)
      BUILD_ARCH_DIR=amd64
      INSTALL_ARCH_DIR=amd64
      JRE_ARCH_DIR=amd64
      CROSS_TARGET_ARCH=x86_64
      ARCHFLAG="-m64"
      ;;
    i?86)
      BUILD_ARCH_DIR=i586
      INSTALL_ARCH_DIR=i386
      JRE_ARCH_DIR=i386
      ARCH_PREFIX=${LINUX32}
      CROSS_TARGET_ARCH=i386
      ARCHFLAG="-m32"
      ;;
    alpha*)
      BUILD_ARCH_DIR=alpha
      INSTALL_ARCH_DIR=alpha
      JRE_ARCH_DIR=alpha
      CROSS_TARGET_ARCH=alpha
      ;;
    arm*)
      BUILD_ARCH_DIR=arm
      INSTALL_ARCH_DIR=arm
      JRE_ARCH_DIR=arm
      CROSS_TARGET_ARCH=arm
      ;;
    mips)
      BUILD_ARCH_DIR=mips
      INSTALL_ARCH_DIR=mips
      JRE_ARCH_DIR=mips
      CROSS_TARGET_ARCH=mips
       ;;
    mipsel)
      BUILD_ARCH_DIR=mipsel
      INSTALL_ARCH_DIR=mipsel
      JRE_ARCH_DIR=mipsel
      CROSS_TARGET_ARCH=mipsel
       ;;
    powerpc)
      BUILD_ARCH_DIR=ppc
      INSTALL_ARCH_DIR=ppc
      JRE_ARCH_DIR=ppc
      ARCH_PREFIX=${LINUX32}
      CROSS_TARGET_ARCH=ppc
      ARCHFLAG="-m32"
       ;;
    powerpc64)
      BUILD_ARCH_DIR=ppc64
      INSTALL_ARCH_DIR=ppc64
      JRE_ARCH_DIR=ppc64
      CROSS_TARGET_ARCH=ppc64
      ARCHFLAG="-m64"
       ;;
    sparc)
      BUILD_ARCH_DIR=sparc
      INSTALL_ARCH_DIR=sparc
      JRE_ARCH_DIR=sparc
      CROSS_TARGET_ARCH=sparc
      ARCH_PREFIX=${LINUX32}
      ARCHFLAG="-m32"
       ;;
    sparc64)
      BUILD_ARCH_DIR=sparcv9
      INSTALL_ARCH_DIR=sparcv9
      JRE_ARCH_DIR=sparc64
      CROSS_TARGET_ARCH=sparc64
      ARCHFLAG="-m64"
       ;;
    s390)
      BUILD_ARCH_DIR=s390
      INSTALL_ARCH_DIR=s390
      JRE_ARCH_DIR=s390
      ARCH_PREFIX=${LINUX32}
      CROSS_TARGET_ARCH=s390
      ARCHFLAG="-m31"
       ;;
    s390x)
      BUILD_ARCH_DIR=s390x
      INSTALL_ARCH_DIR=s390x
      JRE_ARCH_DIR=s390x
      CROSS_TARGET_ARCH=s390x
      ARCHFLAG="-m64"
       ;;
    sh*)
      BUILD_ARCH_DIR=sh
      INSTALL_ARCH_DIR=sh
      JRE_ARCH_DIR=sh
      CROSS_TARGET_ARCH=sh
      ;;
    *)
      BUILD_ARCH_DIR=`uname -m`
      INSTALL_ARCH_DIR=$BUILD_ARCH_DIR
      JRE_ARCH_DIR=$INSTALL_ARCH_DIR
      CROSS_TARGET_ARCH=$BUILD_ARCH_DIR
      ;;
  esac
  AC_SUBST(BUILD_ARCH_DIR)
  AC_SUBST(INSTALL_ARCH_DIR)
  AC_SUBST(JRE_ARCH_DIR)
  AC_SUBST(ARCH_PREFIX)
  AC_SUBST(CROSS_TARGET_ARCH)
  AC_SUBST(ARCHFLAG)
])

AC_DEFUN([IT_SET_OS_DIRS],
[
  case "${target_os}" in
    *linux*)
      BUILD_OS_DIR=linux
      OS_PATH=
      ;;
    *solaris*)
      BUILD_OS_DIR=solaris
      OS_PATH=/opt/SunStudioExpress/bin:/opt/SUNWpro/bin:/usr/gnu/bin
      ;;
    *darwin*|*bsd*)
      BUILD_OS_DIR=bsd
      OS_PATH=
      ;;
    *)
      AC_MSG_ERROR([unsupported operating system ${target_os}])
      ;;
  esac
  AC_SUBST(BUILD_OS_DIR)
  AC_SUBST(OS_PATH)
])

AC_DEFUN_ONCE([IT_FIND_COMPILER],
[
  IT_FIND_JAVAC
  IT_FIND_ECJ

  if test "x${JAVAC}" = "x"; then
    if test "x{ECJ}" != "x"; then
      JAVAC="${ECJ} -nowarn"
    fi
  fi

  IT_USING_ECJ

  AC_SUBST(ECJ)
  AC_SUBST(JAVAC)
])

AC_DEFUN_ONCE([IT_FIND_ECJ],
[
  ECJ_DEFAULT=/usr/bin/ecj
  AC_MSG_CHECKING([if an ecj binary was specified])
  AC_ARG_WITH([ecj],
	      [AS_HELP_STRING(--with-ecj,bytecode compilation with ecj)],
  [
    if test "x${withval}" = "xyes"; then
      ECJ=no
    else
      ECJ="${withval}"
    fi
  ],
  [ 
    ECJ=no
  ])
  AC_MSG_RESULT(${ECJ})
  if test "x${ECJ}" = "xno"; then
    ECJ=${ECJ_DEFAULT}
  fi
  AC_MSG_CHECKING([if $ECJ is a valid executable file])
  if test -x "${ECJ}" && test -f "${ECJ}"; then
    AC_MSG_RESULT([yes])
  else
    AC_MSG_RESULT([no])
    ECJ=""
    AC_PATH_PROG(ECJ, "ecj")
    if test -z "${ECJ}"; then
      AC_PATH_PROG(ECJ, "ecj-3.1")
    fi
    if test -z "${ECJ}"; then
      AC_PATH_PROG(ECJ, "ecj-3.2")
    fi
    if test -z "${ECJ}"; then
      AC_PATH_PROG(ECJ, "ecj-3.3")
    fi
    if test -z "${ECJ}"; then
      AC_PATH_PROG(ECJ, "ecj-3.4")
    fi
  fi
])

AC_DEFUN_ONCE([IT_FIND_JAVAC],
[
  AC_REQUIRE([IT_CHECK_FOR_JDK])
  JAVAC_DEFAULT=${SYSTEM_JDK_DIR}/bin/javac
  AC_MSG_CHECKING([if a javac binary was specified])
  AC_ARG_WITH([javac],
	      [AS_HELP_STRING(--with-javac,bytecode compilation with javac)],
  [
    if test "x${withval}" = "xyes"; then
      JAVAC=no
    else
      JAVAC="${withval}"
    fi
  ],
  [
    JAVAC=no
  ])
  AC_MSG_RESULT(${JAVAC})
  if test "x${JAVAC}" = "xno"; then
    JAVAC=${JAVAC_DEFAULT}
  fi
  AC_MSG_CHECKING([if $JAVAC is a valid executable file])
  if test -x "${JAVAC}" && test -f "${JAVAC}"; then
    AC_MSG_RESULT([yes])
  else
    AC_MSG_RESULT([no])
    JAVAC=""
    AC_PATH_PROG(JAVAC, "javac")
  fi
  AC_SUBST(JAVAC)
  ])
])

AC_DEFUN_ONCE([IT_FIND_JAVA],
[
  AC_REQUIRE([IT_CHECK_FOR_JDK])
  JAVA_DEFAULT=${SYSTEM_JDK_DIR}/bin/java
  AC_MSG_CHECKING([if a java binary was specified])
  AC_ARG_WITH([java],
              [AS_HELP_STRING(--with-java,specify location of the 1.5 java vm)],
  [
    if test "x${withval}" = "xyes"; then
      JAVA=no
    else
      JAVA="${withval}"
    fi
  ],
  [
    JAVA=no
  ])
  AC_MSG_RESULT(${JAVA})
  if test "x${JAVA}" = "xno"; then
    JAVA=${JAVA_DEFAULT}
  fi
  AC_MSG_CHECKING([if $JAVA is a valid executable file])
  if test -x "${JAVA}" && test -f "${JAVA}"; then
    AC_MSG_RESULT([yes])
  else
    AC_MSG_RESULT([no])
    JAVA=""
    AC_PATH_PROG(JAVA, "java")
    if test -z "${JAVA}"; then
      AC_PATH_PROG(JAVA, "gij")
    fi
    if test -z "${JAVA}"; then
      AC_PATH_PROG(JAVA, "cacao")
    fi
    if test -z "${JAVA}"; then
      AC_MSG_ERROR("A 1.5-compatible Java VM is required.")
    fi
  fi
  AC_SUBST(JAVA)
])

AC_DEFUN_ONCE([IT_CP_SUPPORTS_REFLINK],
[
  AC_CACHE_CHECK([if cp supports --reflink], it_cv_reflink, [
    touch tmp.$$
    if cp --reflink=auto tmp.$$ tmp2.$$ >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_reflink=yes;
    else
      it_cv_reflink=no;
    fi
    rm -f tmp.$$ tmp2.$$
  ])
  AM_CONDITIONAL([CP_SUPPORTS_REFLINK], test x"${it_cv_reflink}" = "xyes")
])

AC_DEFUN_ONCE([IT_WITH_OPENJDK_SRC_DIR],
[
  DEFAULT_SRC_DIR=${abs_top_builddir}/openjdk
  AC_MSG_CHECKING([for an OpenJDK source directory])
  AC_ARG_WITH([openjdk-src-dir],
              [AS_HELP_STRING(--with-openjdk-src-dir=DIR,specify the location of the openjdk sources)],
  [
    OPENJDK_SRC_DIR=${withval}
    with_external_src_dir=true
  ],
  [ 
    OPENJDK_SRC_DIR=${DEFAULT_SRC_DIR}
    with_external_src_dir=false
  ])
  AC_MSG_RESULT(${OPENJDK_SRC_DIR})
  AC_SUBST(OPENJDK_SRC_DIR)
  if test "x${with_external_src_dir}" = "xtrue"; then
    AC_MSG_CHECKING([if ${OPENJDK_SRC_DIR}/README exists])
    if test -f ${OPENJDK_SRC_DIR}/README; then
      openjdk_src_dir_valid=yes;
    else
      openjdk_src_dir_valid="no, resetting to ${DEFAULT_SRC_DIR}";
      OPENJDK_SRC_DIR=${DEFAULT_SRC_DIR}
      with_external_src_dir=false
    fi
    AC_MSG_RESULT(${openjdk_src_dir_valid})
    if test "x${openjdk_src_dir_valid}" = "xyes"; then
      AC_MSG_CHECKING([if we can hard link rather than copy the OpenJDK source directory])
      if cp -l ${OPENJDK_SRC_DIR}/README tmp.$$ >&AS_MESSAGE_LOG_FD 2>&1; then
        openjdk_src_dir_hardlinkable=yes;
      else
        openjdk_src_dir_hardlinkable=no;
      fi
      AC_MSG_RESULT(${openjdk_src_dir_hardlinkable})
      rm -f tmp.$$
    fi
  fi
  AM_CONDITIONAL(OPENJDK_SRC_DIR_FOUND, test "x${with_external_src_dir}" = "xtrue")
  AM_CONDITIONAL(OPENJDK_SRC_DIR_HARDLINKABLE, test "x${openjdk_src_dir_hardlinkable}" = "xyes")
])

AC_DEFUN_ONCE([IT_CAN_HARDLINK_TO_SOURCE_TREE],
[
  AC_CACHE_CHECK([if we can hard link rather than copy from ${abs_top_srcdir}], it_cv_hardlink_src, [
    if cp -l ${abs_top_srcdir}/README tmp.$$ >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_hardlink_src=yes;
    else
      it_cv_hardlink_src=no;
    fi
    rm -f tmp.$$
  ])
  AM_CONDITIONAL([SRC_DIR_HARDLINKABLE], test x"${it_cv_hardlink_src}" = "xyes")
])

AC_DEFUN([IT_FIND_ECJ_JAR],
[
  AC_MSG_CHECKING([for an ecj JAR file])
  AC_ARG_WITH([ecj-jar],
              [AS_HELP_STRING(--with-ecj-jar,specify location of the ECJ jar)],
  [
    if test -f "${withval}"; then
      ECJ_JAR="${withval}"
    fi
  ],
  [
    ECJ_JAR=
  ])
  if test -z "${ECJ_JAR}"; then
    for jar in /usr/share/java/eclipse-ecj.jar \
      /usr/share/java/ecj.jar \
      /usr/share/eclipse-ecj/ecj.jar \
      /usr/share/eclipse-ecj-3.{2,3,4,5}/lib/ecj.jar \
      /usr/share/ecj-gcj-3.{2,3,4,5}/lib/ecj.jar ; do
        if test -e $jar; then
          ECJ_JAR=$jar
	  break
        fi
      done
      if test -z "${ECJ_JAR}"; then
        ECJ_JAR=no
      fi
  fi
  AC_MSG_RESULT(${ECJ_JAR})
  if test "x${JAVAC}" = "x" && test "x${ECJ_JAR}" = "xno"; then
    AC_MSG_ERROR([No compiler or ecj JAR file was found; try --with-javac, --with-ecj or --with-ecj-jar])
  fi
  AC_SUBST(ECJ_JAR)
])

AC_DEFUN([IT_CHECK_GCC_VERSION],
[
  AC_MSG_CHECKING([version of GCC])
  gcc_ver=`${CC} -dumpversion`
  gcc_major_ver=`echo ${gcc_ver}|cut -d'.' -f1`
  gcc_minor_ver=`echo ${gcc_ver}|cut -d'.' -f2`
  AM_CONDITIONAL(GCC_OLD, test ! ${gcc_major_ver} -ge 4 -a ${gcc_minor_ver} -ge 3)
  AC_MSG_RESULT([${gcc_ver} (major version ${gcc_major_ver}, minor version ${gcc_minor_ver})])
])

AC_DEFUN([IT_FIND_JAVAH],
[
  AC_REQUIRE([IT_CHECK_FOR_JDK])
  JAVAH_DEFAULT=${SYSTEM_JDK_DIR}/bin/javah
  AC_MSG_CHECKING([if a javah binary was specified])
  AC_ARG_WITH([javah],
              [AS_HELP_STRING(--with-javah,specify location of the Java header generator)],
  [
    if test "x${withval}" = "xyes"; then
      JAVAH=no
    else
      JAVAH="${withval}"
    fi
  ],
  [
    JAVAH=no
  ])
  AC_MSG_RESULT(${JAVAH})
  if test "x${JAVAH}" = "xno"; then
    JAVAH=${JAVAH_DEFAULT}
  fi
  AC_MSG_CHECKING([if $JAVAH is a valid executable file])
  if test -x "${JAVAH}" && test -f "${JAVAH}"; then
    AC_MSG_RESULT([yes])
  else
    AC_MSG_RESULT([no])
    JAVAH=""
    AC_PATH_PROG(JAVAH, "javah")
    if test -z "${JAVAH}"; then
      AC_PATH_PROG(JAVAH, "gjavah")
    fi
    if test -z "${JAVAH}"; then
      AC_MSG_ERROR("A Java header generator was not found.")
    fi
  fi
  AC_SUBST(JAVAH)
])

AC_DEFUN([IT_FIND_JAR],
[
  AC_REQUIRE([IT_CHECK_FOR_JDK])
  JAR_DEFAULT=${SYSTEM_JDK_DIR}/bin/jar
  AC_MSG_CHECKING([if a jar binary was specified])
  AC_ARG_WITH([jar],
              [AS_HELP_STRING(--with-jar,specify location of Java archive tool (jar))],
  [
    if test "x${withval}" = "xyes"; then
      JAR=no
    else
      JAR="${withval}"
    fi
  ],
  [
    JAR=no
  ])
  AC_MSG_RESULT(${JAR})
  if test "x${JAR}" = "xno"; then
    JAR=${JAR_DEFAULT}
  fi
  AC_MSG_CHECKING([if $JAR is a valid executable file])
  if test -x "${JAR}" && test -f "${JAR}"; then
    AC_MSG_RESULT([yes])
  else
    AC_MSG_RESULT([no])
    JAR=""
    AC_PATH_PROG(JAR, "jar")
    if test -z "${JAR}"; then
      AC_PATH_PROG(JAR, "gjar")
    fi
    if test -z "${JAR}"; then
      AC_MSG_ERROR("No Java archive tool was found.")
    fi
  fi
  AC_MSG_CHECKING([whether jar supports @<file> argument])
  touch _config.txt
  cat >_config.list <<EOF
_config.txt
EOF
  if $JAR cf _config.jar @_config.list >&AS_MESSAGE_LOG_FD 2>&1; then
    JAR_KNOWS_ATFILE=1
    AC_MSG_RESULT(yes)
  else
    JAR_KNOWS_ATFILE=
    AC_MSG_RESULT(no)
  fi
  AC_MSG_CHECKING([whether jar supports stdin file arguments])
  if cat _config.list | $JAR cf@ _config.jar >&AS_MESSAGE_LOG_FD 2>&1; then
    JAR_ACCEPTS_STDIN_LIST=1
    AC_MSG_RESULT(yes)
  else
    JAR_ACCEPTS_STDIN_LIST=
    AC_MSG_RESULT(no)
  fi
  rm -f _config.list _config.jar
  AC_MSG_CHECKING([whether jar supports -J options at the end])
  if $JAR cf _config.jar _config.txt -J-Xmx896m >&AS_MESSAGE_LOG_FD 2>&1; then
    JAR_KNOWS_J_OPTIONS=1
    AC_MSG_RESULT(yes)
  else
    JAR_KNOWS_J_OPTIONS=
    AC_MSG_RESULT(no)
  fi
  rm -f _config.txt _config.jar
  AC_SUBST(JAR)
  AC_SUBST(JAR_KNOWS_ATFILE)
  AC_SUBST(JAR_ACCEPTS_STDIN_LIST)
  AC_SUBST(JAR_KNOWS_J_OPTIONS)
])

AC_DEFUN([IT_FIND_RMIC],
[
  AC_REQUIRE([IT_CHECK_FOR_JDK])
  RMIC_DEFAULT=${SYSTEM_JDK_DIR}/bin/rmic
  AC_MSG_CHECKING([if a rmic binary was specified])
  AC_ARG_WITH([rmic],
              [AS_HELP_STRING(--with-rmic,specify location of the RMI compiler)],
  [
    if test "x${withval}" = "xyes"; then
      RMIC=no
    else
      RMIC="${withval}"
    fi
  ],
  [
    RMIC=no
  ])
  AC_MSG_RESULT(${RMIC})
  if test "x${RMIC}" = "xno"; then
    RMIC=${RMIC_DEFAULT}
  fi
  AC_MSG_CHECKING([if $RMIC is a valid executable file])
  if test -x "${RMIC}" && test -f "${RMIC}"; then
    AC_MSG_RESULT([yes])
  else
    AC_MSG_RESULT([no])
    RMIC=""
    AC_PATH_PROG(RMIC, "rmic")
    if test -z "${RMIC}"; then
      AC_PATH_PROG(RMIC, "grmic")
    fi
    if test -z "${RMIC}"; then
      AC_MSG_ERROR("An RMI compiler was not found.")
    fi
  fi
  AC_SUBST(RMIC)
])

AC_DEFUN([IT_FIND_NATIVE2ASCII],
[
  AC_REQUIRE([IT_CHECK_FOR_JDK])
  NATIVE2ASCII_DEFAULT=${SYSTEM_JDK_DIR}/bin/native2ascii
  AC_MSG_CHECKING([if a native2ascii binary was specified])
  AC_ARG_WITH([native2ascii],
              [AS_HELP_STRING(--with-native2ascii,specify location of the native2ascii converter)],
  [
    if test "x${withval}" = "xyes"; then
      NATIVE2ASCII=no
    else
      NATIVE2ASCII="${withval}"
    fi
  ],
  [
    NATIVE2ASCII=no
  ])
  AC_MSG_RESULT(${NATIVE2ASCII})
  if test "x${NATIVE2ASCII}" = "xno"; then
    NATIVE2ASCII=${NATIVE2ASCII_DEFAULT}
  fi
  AC_MSG_CHECKING([if $NATIVE2ASCII is a valid executable file])
  if test -x "${NATIVE2ASCII}" && test -f "${NATIVE2ASCII}"; then
    AC_MSG_RESULT([yes])
  else
    AC_MSG_RESULT([no])
    NATIVE2ASCII=""
    AC_PATH_PROG(NATIVE2ASCII, "native2ascii")
    if test -z "${NATIVE2ASCII}"; then
      AC_PATH_PROG(NATIVE2ASCII, "gnative2ascii")
    fi
    if test -z "${NATIVE2ASCII}"; then
      AC_MSG_ERROR("A native2ascii converter was not found.")
    fi
  fi
  AC_SUBST([NATIVE2ASCII])
])

AC_DEFUN([IT_FIND_ENDORSED_JARS],
[
  AC_MSG_CHECKING(for endorsed jars dir)
  AC_ARG_WITH([endorsed-dir],
              [AS_HELP_STRING(--with-endorsed-dir,specify directory of endorsed jars (xalan-j2.jar, xalan-j2-serializer.jar, xerces-j2.jar))],
  [
    if test "x${withval}" = "xno"; then
        ENDORSED_JARS="${withval}"
        AC_MSG_RESULT(${withval})
    else if test -f "${withval}/xalan-j2.jar"; then
      if test -f "${withval}/xalan-j2-serializer.jar"; then
        if test -f "${withval}/xerces-j2.jar"; then
          ENDORSED_JARS="${withval}"
          AC_MSG_RESULT(${withval})
        fi
      fi
    fi
  ],
  [
    ENDORSED_JARS=
  ])
  if test -z "${ENDORSED_JARS}"; then
    if test -f "/usr/share/java/xalan-j2.jar"; then
      if test -f "/usr/share/java/xalan-j2-serializer.jar"; then
        if test -f "/usr/share/java/xerces-j2.jar"; then
          ENDORSED_JARS="/usr/share/java/xalan-j2.jar /usr/share/java/xalan-j2-serializer.jar /usr/share/java/xerces-j2.jar"
          AC_MSG_RESULT(/usr/share/java)
        fi
      fi
    fi
    if test -z "${ENDORSED_JARS}"; then
      AC_MSG_RESULT(missing)
    fi
  fi
  if test -z "${ENDORSED_JARS}"; then
    AC_MSG_ERROR("A directory containing required jars (xalan-j2.jar, xalan-j2-serializer.jar, xerces-j2.jar) was not found.")
  fi
  AC_SUBST(ENDORSED_JARS)
])

AC_DEFUN([IT_WITH_OPENJDK_SRC_ZIP],
[
  AC_MSG_CHECKING([for an OpenJDK source zip])
  AC_ARG_WITH([openjdk-src-zip],
              [AS_HELP_STRING(--with-openjdk-src-zip,specify the location of the openjdk source zip)],
  [
    ALT_OPENJDK_SRC_ZIP=${withval}
    if test "x${ALT_OPENJDK_SRC_ZIP}" = "xno"; then
      ALT_OPENJDK_SRC_ZIP="not specified"
    elif ! test -f ${ALT_OPENJDK_SRC_ZIP} ; then
      AC_MSG_ERROR([Invalid OpenJDK source zip specified: ${ALT_OPENJDK_SRC_ZIP}])
    fi
  ],
  [ 
    ALT_OPENJDK_SRC_ZIP="not specified"
  ])
  AM_CONDITIONAL(USE_ALT_OPENJDK_SRC_ZIP, test "x${ALT_OPENJDK_SRC_ZIP}" != "xnot specified")
  AC_MSG_RESULT(${ALT_OPENJDK_SRC_ZIP})
  AC_SUBST(ALT_OPENJDK_SRC_ZIP)
])

AC_DEFUN([IT_WITH_ALT_JAR_BINARY],
[
  AC_MSG_CHECKING([for an alternate jar command])
  AC_ARG_WITH([alt-jar],
              [AS_HELP_STRING(--with-alt-jar, specify the location of an alternate jar binary to use for building)],
  [
    ALT_JAR_CMD=${withval}
    AM_CONDITIONAL(USE_ALT_JAR, test x = x)
  ],
  [ 
    ALT_JAR_CMD="not specified"
    AM_CONDITIONAL(USE_ALT_JAR, test x != x)
  ])
  AC_MSG_RESULT(${ALT_JAR_CMD})
  AC_SUBST(ALT_JAR_CMD)
])

AC_DEFUN([IT_FIND_RHINO_JAR],
[
  AC_MSG_CHECKING([whether to include Javascript support via Rhino])
  AC_ARG_WITH([rhino],
              [AS_HELP_STRING(--with-rhino,specify location of the rhino jar)],
  [
    case "${withval}" in
      yes)
	RHINO_JAR=yes
        ;;
      no)
        RHINO_JAR=no
        ;;
      *)
    	if test -f "${withval}"; then
          RHINO_JAR="${withval}"
        else
	  AC_MSG_RESULT([not found])
          AC_MSG_ERROR("The rhino jar ${withval} was not found.")
        fi
	;;
     esac
  ],
  [
    RHINO_JAR=yes
  ])
  if test x"${RHINO_JAR}" = "xyes"; then
    if test -e "/usr/share/java/rhino.jar"; then
      RHINO_JAR=/usr/share/java/rhino.jar
    elif test -e "/usr/share/java/js.jar"; then
      RHINO_JAR=/usr/share/java/js.jar
    elif test -e "/usr/share/rhino-1.6/lib/js.jar"; then
      RHINO_JAR=/usr/share/rhino-1.6/lib/js.jar
    fi
    if test x"${RHINO_JAR}" = "xyes"; then
      AC_MSG_RESULT([not found])
      AC_MSG_ERROR("A rhino jar was not found in /usr/share/java as either rhino.jar or js.jar.")
    fi
  fi
  AC_MSG_RESULT(${RHINO_JAR})
  AM_CONDITIONAL(WITH_RHINO, test x"${RHINO_JAR}" != "xno")
dnl Clear RHINO_JAR if it doesn't contain a valid filename
  if test x"${RHINO_JAR}" = "xno"; then
    RHINO_JAR=
  fi
  AC_SUBST(RHINO_JAR)
])

AC_DEFUN([IT_DISABLE_OPTIMIZATIONS],
[
  AC_MSG_CHECKING([whether to disable optimizations and build with -O0 -g])
  AC_ARG_ENABLE([optimizations],
                [AS_HELP_STRING(--disable-optimizations,build with -O0 -g [[default=no]])],
  [
    case "${enableval}" in
      no)
        disable_optimizations=yes
        ;;
      *)
        disable_optimizations=no
        ;;
    esac
  ],
  [
    disable_optimizations=no
  ])
  AC_MSG_RESULT([$disable_optimizations])
  AM_CONDITIONAL([DISABLE_OPTIMIZATIONS], test x"${disable_optimizations}" = "xyes")
])

AC_DEFUN([IT_FIND_TOOL],
[AC_PATH_TOOL([$1],[$2])
 if test x"$$1" = x ; then
   AC_MSG_ERROR([$2 program not found in PATH])
 fi
 AC_SUBST([$1])
])

AC_DEFUN_ONCE([IT_ENABLE_ZERO_BUILD],
[
  AC_REQUIRE([IT_SET_ARCH_SETTINGS])
  AC_REQUIRE([IT_ENABLE_CACAO])
  AC_REQUIRE([IT_ENABLE_JAMVM])
  AC_REQUIRE([IT_SET_SHARK_BUILD])
  AC_REQUIRE([IT_HAS_NATIVE_HOTSPOT_PORT])
  AC_MSG_CHECKING([whether to use the zero-assembler port])
  use_zero=no
  AC_ARG_ENABLE([zero],
                [AS_HELP_STRING(--enable-zero,
                               use zero-assembler port on non-zero platforms)],
  [
    case "${enableval}" in
      no)
        use_zero=no
        ;;
      *)
        use_zero=yes
        ;;
    esac
  ],
  [
    if test "x${use_shark}" = "xyes"; then
      use_zero=yes;
    else if test "x$has_native_hotspot_port" = "xno"; then
      if test "x${ENABLE_CACAO}" = xyes || \
         test "x${ENABLE_JAMVM}" = xyes; then
           use_zero=no
      else
           use_zero=yes
      fi
    fi; fi
  ])
  AC_MSG_RESULT($use_zero)
  AM_CONDITIONAL(ZERO_BUILD, test "x${use_zero}" = xyes)

  ZERO_LIBARCH="${INSTALL_ARCH_DIR}"
  dnl can't use AC_CHECK_SIZEOF on multilib
  case "${ZERO_LIBARCH}" in
    i386|ppc|s390|sparc)
      ZERO_BITSPERWORD=32
      ;;
    amd64|ppc64|s390x|sparc64)
      ZERO_BITSPERWORD=64
      ;;
    *)
      AC_CHECK_SIZEOF(void *)
      ZERO_BITSPERWORD=`expr "${ac_cv_sizeof_void_p}" "*" 8`
  esac
  AC_C_BIGENDIAN([ZERO_ENDIANNESS="big"], [ZERO_ENDIANNESS="little"])
  case "${ZERO_LIBARCH}" in
    i386)
      ZERO_ARCHDEF="IA32"
      ;;
    ppc*)
      ZERO_ARCHDEF="PPC"
      ;;
    s390*)
      ZERO_ARCHDEF="S390"
      ;;
    sparc*)
      ZERO_ARCHDEF="SPARC"
      ;;
    *)
      ZERO_ARCHDEF=`echo ${ZERO_LIBARCH} | tr a-z A-Z`
  esac
  AC_SUBST(ZERO_LIBARCH)
  AC_SUBST(ZERO_BITSPERWORD)
  AC_SUBST(ZERO_ENDIANNESS)
  AC_SUBST(ZERO_ARCHDEF)
  AC_CONFIG_FILES([jvm.cfg])
  AC_CONFIG_FILES([ergo.c])
])

AC_DEFUN_ONCE([IT_SET_SHARK_BUILD],
[
  AC_MSG_CHECKING(whether to use the Shark JIT)
  shark_selected=no
  AC_ARG_ENABLE([shark], [AS_HELP_STRING(--enable-shark, use Shark JIT)],
  [
    case "${enableval}" in
      no)
        ;;
      *)
        shark_selected=yes
        ;;
    esac
  ])

  use_shark=no
  if test "x${shark_selected}" = "xyes"; then
      use_shark=yes
  fi
  AC_MSG_RESULT($use_shark)

  AM_CONDITIONAL(SHARK_BUILD, test "x${use_shark}" = xyes)
])

AC_DEFUN_ONCE([IT_ENABLE_JAMVM],
[
  AC_MSG_CHECKING(whether to use JamVM as VM)
  AC_ARG_ENABLE([jamvm],
	      [AS_HELP_STRING(--enable-jamvm,use JamVM as VM [[default=no]])],
  [
    case "${enableval}" in
      yes)
        ENABLE_JAMVM=yes
        ;;
      *)
        ENABLE_JAMVM=no
        ;;
    esac
  ],
  [
    ENABLE_JAMVM=no
  ])

  AC_MSG_RESULT(${ENABLE_JAMVM})
  AM_CONDITIONAL(ENABLE_JAMVM, test x"${ENABLE_JAMVM}" = "xyes")
  AC_SUBST(ENABLE_JAMVM)
  AC_CONFIG_FILES([jvm.jamvm.cfg])
])

AC_DEFUN([IT_WITH_JAMVM_SRC_ZIP],
[
  AC_MSG_CHECKING([for a JamVM source zip])
  AC_ARG_WITH([jamvm-src-zip],
	      [AS_HELP_STRING(--with-jamvm-src-zip,specify the location of the JamVM source zip)],
  [
    ALT_JAMVM_SRC_ZIP=${withval}
    if test "x${ALT_JAMVM_SRC_ZIP}" = "xno"; then
      ALT_JAMVM_SRC_ZIP="not specified"
    elif ! test -f ${ALT_JAMVM_SRC_ZIP} ; then
      AC_MSG_ERROR([Invalid JamVM source zip specified: ${ALT_JAMVM_SRC_ZIP}])
    fi
  ],
  [
    ALT_JAMVM_SRC_ZIP="not specified"
  ])
  AM_CONDITIONAL(USE_ALT_JAMVM_SRC_ZIP, test "x${ALT_JAMVM_SRC_ZIP}" != "xnot specified")
  AC_MSG_RESULT(${ALT_JAMVM_SRC_ZIP})
  AC_SUBST(ALT_JAMVM_SRC_ZIP)
])

AC_DEFUN_ONCE([IT_ENABLE_CACAO],
[
  AC_MSG_CHECKING(whether to use CACAO as VM)
  AC_ARG_ENABLE([cacao],
	      [AS_HELP_STRING(--enable-cacao,use CACAO as VM [[default=no]])],
  [
    case "${enableval}" in
      yes)
        ENABLE_CACAO=yes
        ;;
      *)
        ENABLE_CACAO=no
        ;;
    esac
  ],
  [
    ENABLE_CACAO=no
  ])

  AC_MSG_RESULT(${ENABLE_CACAO})
  AM_CONDITIONAL(ENABLE_CACAO, test x"${ENABLE_CACAO}" = "xyes")
  AC_SUBST(ENABLE_CACAO)
  AC_CONFIG_FILES([jvm.cacao.cfg])
])

AC_DEFUN([IT_WITH_CACAO_HOME],
[
  AC_MSG_CHECKING([for a CACAO home directory])
  AC_ARG_WITH([cacao-home],
              [AS_HELP_STRING([--with-cacao-home],
                              [CACAO home directory [[default=/usr/local/cacao]]])],
              [
                case "${withval}" in
                yes)
                  CACAO_IMPORT_PATH=/usr/local/cacao
                  ;;
                *)
                  CACAO_IMPORT_PATH=${withval}
                  ;;
                esac
                AM_CONDITIONAL(USE_SYSTEM_CACAO, true)
              ],
              [
                CACAO_IMPORT_PATH="\$(abs_top_builddir)/cacao/install"
                AM_CONDITIONAL(USE_SYSTEM_CACAO, false)
              ])
  AC_MSG_RESULT(${CACAO_IMPORT_PATH})
  AC_SUBST(CACAO_IMPORT_PATH)
])

AC_DEFUN([IT_WITH_CACAO_SRC_ZIP],
[
  AC_MSG_CHECKING([for a CACAO source zip])
  AC_ARG_WITH([cacao-src-zip],
              [AS_HELP_STRING(--with-cacao-src-zip,specify the location of the CACAO source zip)],
  [
    ALT_CACAO_SRC_ZIP=${withval}
    if test "x${ALT_CACAO_SRC_ZIP}" = "xno"; then
      ALT_CACAO_SRC_ZIP="not specified"
    elif ! test -f ${ALT_CACAO_SRC_ZIP} ; then
      AC_MSG_ERROR([Invalid CACAO source zip specified: ${ALT_CACAO_SRC_ZIP}])
    fi
  ],
  [ 
    ALT_CACAO_SRC_ZIP="not specified"
  ])
  AM_CONDITIONAL(USE_ALT_CACAO_SRC_ZIP, test "x${ALT_CACAO_SRC_ZIP}" != "xnot specified")
  AC_MSG_RESULT(${ALT_CACAO_SRC_ZIP})
  AC_SUBST(ALT_CACAO_SRC_ZIP)
])

AC_DEFUN([IT_WITH_CACAO_SRC_DIR],
[
  AC_MSG_CHECKING([for a CACAO source directory])
  AC_ARG_WITH([cacao-src-dir],
              [AS_HELP_STRING(--with-cacao-src-dir,specify the location of the Cacao sources)],
  [
    ALT_CACAO_SRC_DIR=${withval}
    AM_CONDITIONAL(USE_ALT_CACAO_SRC_DIR, test x = x)
  ],
  [
    ALT_CACAO_SRC_DIR="not specified"
    AM_CONDITIONAL(USE_ALT_CACAO_SRC_DIR, test x != x)
  ])
  AC_MSG_RESULT(${ALT_CACAO_SRC_DIR})
  AC_SUBST(ALT_CACAO_SRC_DIR)
])

AC_DEFUN([IT_WITH_GCJ],
[
  AC_MSG_CHECKING([whether to compile ecj natively])
  AC_ARG_WITH([gcj],
	      [AS_HELP_STRING(--with-gcj,location of gcj for natively compiling ecj)],
  [
    GCJ="${withval}"
  ],
  [ 
    GCJ="no"
  ])
  AC_MSG_RESULT([${GCJ}])
  if test "x${GCJ}" = xyes; then
    AC_PATH_TOOL([GCJ],[gcj])
  fi
  AC_SUBST([GCJ])
])

AC_DEFUN_ONCE([IT_WITH_HOTSPOT_BUILD],
[
  AC_REQUIRE([IT_ENABLE_ZERO_BUILD])
  ORIGINAL_BUILD="original"
  DEFAULT_BUILD=${ORIGINAL_BUILD}
  AC_MSG_CHECKING([which HotSpot build to use])
  AC_ARG_WITH([hotspot-build],
	      [AS_HELP_STRING(--with-hotspot-build,the HotSpot build to use (see hotspot.map))],
  [
    HSBUILD="${withval}"
  ],
  [ 
    HSBUILD="${DEFAULT_BUILD}"
  ])
  HSBUILD="${ORIGINAL_BUILD}"
  AC_MSG_RESULT([${HSBUILD}])
  AC_SUBST([HSBUILD])
  AM_CONDITIONAL(WITH_ALT_HSBUILD, test "x${HSBUILD}" != "x${ORIGINAL_BUILD}")
])

AC_DEFUN([IT_WITH_HOTSPOT_SRC_ZIP],
[
  AC_MSG_CHECKING([for a HotSpot source zip])
  AC_ARG_WITH([hotspot-src-zip],
              [AS_HELP_STRING(--with-hotspot-src-zip,specify the location of the hotspot source zip)],
  [
    ALT_HOTSPOT_SRC_ZIP=${withval}
    if test "x${ALT_HOTSPOT_SRC_ZIP}" = "xno"; then
      ALT_HOTSPOT_SRC_ZIP="not specified"
    elif ! test -f ${ALT_HOTSPOT_SRC_ZIP} ; then
      AC_MSG_ERROR([Invalid HotSpot source zip specified: ${ALT_HOTSPOT_SRC_ZIP}])
    fi
  ],
  [ 
    ALT_HOTSPOT_SRC_ZIP="not specified"
  ])
  AM_CONDITIONAL(USE_ALT_HOTSPOT_SRC_ZIP, test "x${ALT_HOTSPOT_SRC_ZIP}" != "xnot specified")
  AC_MSG_RESULT(${ALT_HOTSPOT_SRC_ZIP})
  AC_SUBST(ALT_HOTSPOT_SRC_ZIP)
])

AC_DEFUN([IT_ENABLE_HG],
[
  AC_MSG_CHECKING(whether to retrieve the source code from Mercurial)
  AC_ARG_ENABLE([hg],
                [AS_HELP_STRING(--enable-hg,download source code from Mercurial [[default=no]])],
  [
    case "${enableval}" in
      no)
	enable_hg=no
        ;;
      *)
        enable_hg=yes
        ;;
    esac
  ],
  [
        enable_hg=no
  ])
  AC_MSG_RESULT([${enable_hg}])
  AM_CONDITIONAL([USE_HG], test x"${enable_hg}" = "xyes")
])

AC_DEFUN([IT_WITH_HG_REVISION],
[
  AC_MSG_CHECKING([which Mercurial revision to use])
  AC_ARG_WITH([hg-revision],
	      [AS_HELP_STRING(--with-hg-revision,the Mercurial revision to use)],
  [
    HGREV="${withval}"
    AC_MSG_RESULT([${HGREV}])
  ],
  [ 
    HGREV=""
    AC_MSG_RESULT([tip])
  ])
  AC_SUBST([HGREV])
  AM_CONDITIONAL(WITH_HGREV, test "x${HGREV}" != "x")
])

AC_DEFUN_ONCE([IT_CHECK_IF_BOOTSTRAPPING],
[
  AC_MSG_CHECKING([whether to build a bootstrap version first])
  AC_ARG_ENABLE([bootstrap],
                [AS_HELP_STRING(--disable-bootstrap, don't build a bootstrap version [[default=no]])],
  [
    case "${enableval}" in
      no)
       enable_bootstrap=no
        ;;
      *)
        enable_bootstrap=yes
        ;;
    esac
  ],
  [
        enable_bootstrap=yes
  ])
  AC_MSG_RESULT([${enable_bootstrap}])
  AM_CONDITIONAL([BOOTSTRAPPING], test x"${enable_bootstrap}" = "xyes")
])

AC_DEFUN_ONCE([IT_CHECK_FOR_JDK],
[
  AC_REQUIRE([IT_CHECK_IF_BOOTSTRAPPING])
  AC_MSG_CHECKING([for a JDK home directory])
  AC_ARG_WITH([jdk-home],
             [AS_HELP_STRING([--with-jdk-home],
                              [jdk home directory \
                               (default is first predefined JDK found)])],
             [
                if test "x${withval}" = xyes
                then
                  SYSTEM_JDK_DIR=
                elif test "x${withval}" = xno
                then
	          SYSTEM_JDK_DIR=
	        else
                  SYSTEM_JDK_DIR=${withval}
                fi
              ],
              [
	        SYSTEM_JDK_DIR=
              ])
  if test -z "${SYSTEM_JDK_DIR}"; then
    AC_MSG_RESULT([not specified])
    if test "x${enable_bootstrap}" = "xyes"; then
      BOOTSTRAP_VMS="/usr/lib/jvm/java-gcj /usr/lib/jvm/gcj-jdk /usr/lib/jvm/cacao";
    fi
    ICEDTEA6_VMS="/usr/lib/jvm/icedtea-6 /usr/lib/jvm/icedtea6 /usr/lib/jvm/java-6-openjdk
    		  /usr/lib/jvm/java-1.6.0-openjdk /usr/lib/jvm/java-1.6.0-openjdk.x86_64
		  /usr/lib64/jvm/java-1.6.0-openjdk /usr/lib/jvm/java-1.6.0"
    for dir in ${BOOTSTRAP_VMS} ${ICEDTEA6_VMS} \
    	       /usr/lib/jvm/java-openjdk /usr/lib/jvm/openjdk /usr/lib/jvm/java-icedtea \
	       /etc/alternatives/java_sdk_openjdk ; do
       AC_MSG_CHECKING([for ${dir}]);
       if test -d $dir; then
         SYSTEM_JDK_DIR=$dir ;
	 AC_MSG_RESULT([found]) ;
	 break ;
       else
         AC_MSG_RESULT([not found]) ;
       fi
    done
  else
    AC_MSG_RESULT(${SYSTEM_JDK_DIR})
  fi
  if ! test -d "${SYSTEM_JDK_DIR}"; then
    AC_MSG_ERROR("A JDK home directory could not be found.")
  fi
  AC_SUBST(SYSTEM_JDK_DIR)
])

AC_DEFUN([IT_WITH_TZDATA_DIR],
[
  DEFAULT="/usr/share/javazi"
  AC_MSG_CHECKING([which Java timezone data directory to use])
  AC_ARG_WITH([tzdata-dir],
	      [AS_HELP_STRING(--with-tzdata-dir,set the Java timezone data directory [[default=/usr/share/javazi]])],
  [
    if test "x${withval}" = x || test "x${withval}" = xyes; then
      TZDATA_DIR_SET=yes
      TZDATA_DIR="${DEFAULT}"
    else
      if test "x${withval}" = xno; then
        TZDATA_DIR_SET=no
        AC_MSG_RESULT([no])
      else
        TZDATA_DIR_SET=yes
        TZDATA_DIR="${withval}"
      fi
    fi
  ],
  [ 
    TZDATA_DIR="${DEFAULT}"
  ])
  if test "x${TZDATA_DIR}" != "x"; then
    AC_MSG_RESULT([${TZDATA_DIR}])
  fi
  AC_SUBST([TZDATA_DIR])
  AM_CONDITIONAL(WITH_TZDATA_DIR, test "x${TZDATA_DIR}" != "x")
  AC_CONFIG_FILES([tz.properties])
])

AC_DEFUN([IT_CHECK_ADDITIONAL_VMS],
[
AC_MSG_CHECKING([for additional virtual machines to build])
AC_ARG_WITH(additional-vms,
            AC_HELP_STRING([--with-additional-vms=vm-list],
	    [build additional virtual machines. Valid value is a comma separated string with the backend names `jamvm', `cacao', `zero' and `shark'.]),
[
if test "x${withval}" != x
then
  with_additional_vms=${withval}
  for vm in `echo $with_additional_vms | sed 's/,/ /g'`; do
    case "x$vm" in
      xjamvm) add_vm_jamvm=yes;;
      xcacao) add_vm_cacao=yes;;
      xzero)  add_vm_zero=yes;;
      xshark) add_vm_shark=yes;;
      *) AC_MSG_ERROR([proper usage is --with-additional-vms=vm1,vm2,...])
    esac
  done
fi])
if test "x${with_additional_vms}" = x; then
   with_additional_vms="none";
fi
AC_MSG_RESULT($with_additional_vms)

AM_CONDITIONAL(ADD_JAMVM_BUILD, test x$add_vm_jamvm != x)
AM_CONDITIONAL(ADD_CACAO_BUILD, test x$add_vm_cacao != x)
AM_CONDITIONAL(ADD_ZERO_BUILD,  test x$add_vm_zero  != x || test x$add_vm_shark != x)
AM_CONDITIONAL(ADD_SHARK_BUILD, test x$add_vm_shark != x)
AM_CONDITIONAL(BUILD_CACAO, test x$add_vm_cacao != x || test "x${ENABLE_CACAO}" = xyes)
AM_CONDITIONAL(BUILD_JAMVM, test x$add_vm_jamvm != x || test "x${ENABLE_JAMVM}" = xyes)

if test "x${ENABLE_JAMVM}" = xyes && test "x${ADD_JAMVM_BUILD_TRUE}" = x; then
  AC_MSG_ERROR([additional vm is the default vm])
fi
if test "x${ENABLE_CACAO}" = xyes && test "x${ADD_CACAO_BUILD_TRUE}" = x; then
  AC_MSG_ERROR([additional vm is the default vm])
fi
if test "x${ZERO_BUILD_TRUE}" = x && test "x${ADD_ZERO_BUILD_TRUE}" = x && test "x${ADD_SHARK_BUILD_TRUE}" != x; then
  AC_MSG_ERROR([additional vm is the default vm])
fi
if test "x${SHARK_BUILD_TRUE}" = x && test "x${ADD_SHARK_BUILD_TRUE}" = x; then
  AC_MSG_ERROR([additional vm is the default vm])
fi
if test "x${USE_SYSTEM_CACAO_TRUE}" = x; then
  AC_MSG_ERROR([cannot build with system cacao as additional vm])
fi
if test "x${ADD_ZERO_BUILD_TRUE}" = x && test "x${abs_top_builddir}" = "x${abs_top_srcdir}"; then
  AC_MSG_ERROR([build of additional zero/shark VM requires build with srcdir != builddir])
fi
])

dnl check that javac and java work
AC_DEFUN_ONCE([IT_CHECK_JAVA_AND_JAVAC_WORK],[
  AC_REQUIRE([IT_FIND_JAVA])
  AC_REQUIRE([IT_FIND_COMPILER])
  AC_CACHE_CHECK([if the VM and compiler work together], it_cv_jdk_works, [
  CLASS=Test.java
  BYTECODE=$(echo $CLASS|sed 's#\.java##')
  mkdir tmp.$$
  cd tmp.$$
  cat << \EOF > $CLASS
[/* [#]line __oline__ "configure" */

public class Test
{
    public static void main(String[] args)
    {
      System.out.println("Hello World!");
    }
}]
EOF
  if $JAVAC -cp . $JAVACFLAGS -source 5 -target 5 $CLASS >&AS_MESSAGE_LOG_FD 2>&1; then
    if $JAVA -classpath . $BYTECODE >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_jdk_works=yes;
    else
      it_cv_jdk_works=no;
      AC_MSG_ERROR([VM failed to run compiled class.])
    fi
  else
    it_cv_jdk_works=no;
    AC_MSG_ERROR([Compiler failed to compile Java code.])
  fi
  rm -f $CLASS *.class
  cd ..
  rmdir tmp.$$
  ])
AC_PROVIDE([$0])dnl
])

dnl Generic macro to check for a Java class
dnl Takes two arguments: the name of the macro
dnl and the name of the class.  The macro name
dnl is usually the name of the class with '.'
dnl replaced by '_' and all letters capitalised.
dnl e.g. IT_CHECK_FOR_CLASS([JAVA_UTIL_SCANNER],[java.util.Scanner])
AC_DEFUN([IT_CHECK_FOR_CLASS],[
AC_REQUIRE([IT_CHECK_JAVA_AND_JAVAC_WORK])
AC_CACHE_CHECK([if $2 is missing], it_cv_$1, [
CLASS=Test.java
BYTECODE=$(echo $CLASS|sed 's#\.java##')
mkdir tmp.$$
cd tmp.$$
cat << \EOF > $CLASS
[/* [#]line __oline__ "configure" */
public class Test
{
  public static void main(String[] args)
  {
    System.err.println("Class found: " + $2.class);
  }
}
]
EOF
if $JAVAC -cp . $JAVACFLAGS -nowarn $CLASS >&AS_MESSAGE_LOG_FD 2>&1; then
  if $JAVA -classpath . $BYTECODE >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_$1=no;
  else
      it_cv_$1=yes;
  fi
else
  it_cv_$1=yes;
fi
])
rm -f $CLASS *.class
cd ..
rmdir tmp.$$
AM_CONDITIONAL([LACKS_$1], test x"${it_cv_$1}" = "xyes")
AC_PROVIDE([$0])dnl
])

dnl Generic macro to instantiate a Java class
dnl Takes three arguments: the name of the macro,
dnl the name of the class and the instantiation
dnl paramaters.  The macro name is usually the 
dnl name of the class with '.' replaced by '_' 
dnl and all letters capitalised.
dnl Also takes optional classpath paramater.
dnl e.g. IT_CHECK_FOR_INSTANTIABLE_CLASS([JAVA_LANG_INTEGER],
dnl        [java.lang.Integer],[0],[./bin])
AC_DEFUN([IT_CHECK_IF_INSTANTIABLE],[
AC_REQUIRE([IT_CHECK_JAVA_AND_JAVAC_WORK])
AC_CACHE_CHECK([if $2 is instantiable], it_cv_$1, [
CLASS=Test.java
BYTECODE=$(echo $CLASS|sed 's#\.java##')
mkdir tmp.$$
cd tmp.$$
cat << \EOF > $CLASS
[/* [#]line __oline__ "configure" */
public class Test
{
  public static void main(String[] args)
  {
    new $2($3);
  }
}
]
EOF

if test -z $4; then
  WITH_CLASSPATH=.
else
  WITH_CLASSPATH=$4:.
fi

if $JAVAC -cp $WITH_CLASSPATH $JAVACFLAGS -nowarn $CLASS >&AS_MESSAGE_LOG_FD 2>&1; then
  if $JAVA -classpath $WITH_CLASSPATH $BYTECODE >&AS_MESSAGE_LOG_FD 2>&1; then
    it_cv_$1=yes;
  else
    it_cv_$1=no;
  fi
else
  it_cv_$1=no;
fi
])
rm -f $CLASS *.class
cd ..
rmdir tmp.$$

if test x"${it_cv_$1}" = "xyes"
then
  $1_INSTANTIABLE=yes
else
  $1_INSTANTIABLE=no
fi
AC_PROVIDE([$0])dnl
])

# Finds number of available processors using sysconf
AC_DEFUN_ONCE([IT_FIND_NUMBER_OF_PROCESSORS],[
  IT_FIND_TOOL([GETCONF], [getconf])
  AC_CACHE_CHECK([the number of online processors], it_cv_proc, [
    if number=$($GETCONF _NPROCESSORS_ONLN); then
      it_cv_proc=$number;
    else
      it_cv_proc=2;
    fi
  ])
  AC_PROVIDE([$0])dnl
])

AC_DEFUN_ONCE([IT_HAS_NATIVE_HOTSPOT_PORT],
[
  AC_MSG_CHECKING([if a native HotSpot port is available for this architecture])
  has_native_hotspot_port=yes;
  case "${host_cpu}" in
    i?86) ;;
    sparc) ;;
    x86_64) ;;
    *) has_native_hotspot_port=no;
  esac
  AC_MSG_RESULT([$has_native_hotspot_port])
])

AC_DEFUN_ONCE([IT_GETDTDTYPE_CHECK],[
  AC_REQUIRE([IT_CHECK_JAVA_AND_JAVAC_WORK])
  AC_CACHE_CHECK([if javax.xml.stream.events.Attribute.getDTDType() wrongly returns a QName], it_cv_dtdtype, [
  CLASS=Test.java
  BYTECODE=$(echo $CLASS|sed 's#\.java##')
  mkdir tmp.$$
  cd tmp.$$
  cat << \EOF > $CLASS
[/* [#]line __oline__ "configure" */
import javax.xml.namespace.QName;
import javax.xml.stream.Location;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.StartElement;

import java.lang.reflect.Method;

public class Test
    implements Attribute
{
    // This method will not qualify if using an
    // old version of Classpath where it returns
    // a QName.
    public String getDTDType() { return "Boom"; }

    // Other Attribute methods
    public QName getName() { return null; }
    public String getValue() { return "Bang"; }
    public boolean isSpecified() { return false; }

    // XMLEvent methods
    public Characters asCharacters() { return null; }
    public EndElement asEndElement() { return null; }
    public StartElement asStartElement() { return null; }
    public int getEventType() { return 42; }
    public Location getLocation() { return null; }
    public QName getSchemaType() { return null; }
    public boolean isAttribute() { return true; }
    public boolean isCharacters() { return false; }
    public boolean isEndDocument() { return false; }
    public boolean isEndElement() { return false; }
    public boolean isEntityReference() { return false; }
    public boolean isNamespace() { return false; }
    public boolean isProcessingInstruction() { return false; }
    public boolean isStartDocument() { return false; }
    public boolean isStartElement() { return false; }
    public void writeAsEncodedUnicode(java.io.Writer w) {}

    public static void main(String[] args)
    {
        for (Method m : Attribute.class.getMethods())
            if (m.getName().equals("getDTDType"))
                if (m.getReturnType().equals(QName.class))
                    System.exit(1);
    }
}]
EOF
  if $JAVAC -cp . $JAVACFLAGS -source 5 -target 5 $CLASS >&AS_MESSAGE_LOG_FD 2>&1; then
    if $JAVA -classpath . $BYTECODE >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_dtdtype=no;
    else
      it_cv_dtdtype=yes;
    fi
  else
    it_cv_dtdtype=yes;
  fi
  rm -f $CLASS *.class
  cd ..
  rmdir tmp.$$
  ])
AM_CONDITIONAL([DTDTYPE_QNAME], test x"${it_cv_dtdtype}" = "xyes")
AC_PROVIDE([$0])dnl
])

# Provides the option --with-parallel-jobs
#  * --with-parallel-jobs; use jobs=processors + 1
#  * --with-parallel-jobs=x; use jobs=x
#  * --without-parallel-jobs (default); use jobs=2
AC_DEFUN_ONCE([IT_CHECK_NUMBER_OF_PARALLEL_JOBS],
[
AC_REQUIRE([IT_FIND_NUMBER_OF_PROCESSORS])
proc_default=$(($it_cv_proc + 1))
AC_MSG_CHECKING([how many parallel build jobs to execute])
AC_ARG_WITH([parallel-jobs],
	[AS_HELP_STRING([--with-parallel-jobs],
			[build IcedTea using the specified number of parallel jobs])],
	[
          if test "x${withval}" = xyes; then
            PARALLEL_JOBS=${proc_default}
	  elif test "x${withval}" = xno; then
	    PARALLEL_JOBS=2
          else
            PARALLEL_JOBS=${withval}
          fi
        ],
        [
          PARALLEL_JOBS=2
        ])
AC_MSG_RESULT(${PARALLEL_JOBS})
AC_SUBST(PARALLEL_JOBS)
])

AC_DEFUN_ONCE([IT_DISABLE_TESTS],
[
  AC_MSG_CHECKING([whether to disable the execution of the JTReg tests])
  AC_ARG_ENABLE([tests],
                [AS_HELP_STRING(--disable-tests,do not run the JTReg tests via make check [[default=no]])],
  [
    case "${enableval}" in
      no)
        disable_tests=yes
        ;;
      *)
        disable_tests=no
        ;;
    esac
  ],
  [
    disable_tests=no
  ])
  AC_MSG_RESULT([$disable_tests])
  AM_CONDITIONAL([DISABLE_TESTS], test x"${disable_tests}" = "xyes")
])

AC_DEFUN_ONCE([IT_DISABLE_HOTSPOT_TESTS],
[
  AC_MSG_CHECKING([whether to disable the execution of the HotSpot JTReg tests])
  AC_ARG_ENABLE([hotspot-tests],
                [AS_HELP_STRING(--disable-hotspot-tests,do not run the HotSpot JTReg tests via make check-hotspot [[default=no]])],
  [
    case "${enableval}" in
      no)
        disable_hotspot_tests=yes
        ;;
      *)
        disable_hotspot_tests=no
        ;;
    esac
  ],
  [
    disable_hotspot_tests=no
  ])
  AC_MSG_RESULT([$disable_hotspot_tests])
  AM_CONDITIONAL([DISABLE_HOTSPOT_TESTS], test x"${disable_hotspot_tests}" = "xyes")
])

AC_DEFUN_ONCE([IT_DISABLE_LANGTOOLS_TESTS],
[
  AC_MSG_CHECKING([whether to disable the execution of the langtools JTReg tests])
  AC_ARG_ENABLE([langtools-tests],
                [AS_HELP_STRING(--disable-tests,do not run the langtools JTReg tests via make check-langtools [[default=no]])],
  [
    case "${enableval}" in
      no)
        disable_langtools_tests=yes
        ;;
      *)
        disable_langtools_tests=no
        ;;
    esac
  ],
  [
    disable_langtools_tests=no
  ])
  AC_MSG_RESULT([$disable_langtools_tests])
  AM_CONDITIONAL([DISABLE_LANGTOOLS_TESTS], test x"${disable_langtools_tests}" = "xyes")
])

AC_DEFUN_ONCE([IT_DISABLE_JDK_TESTS],
[
  AC_MSG_CHECKING([whether to disable the execution of the JDK JTReg tests])
  AC_ARG_ENABLE([jdk-tests],
                [AS_HELP_STRING(--disable-tests,do not run the JDK JTReg tests via make check-jdk [[default=no]])],
  [
    case "${enableval}" in
      no)
        disable_jdk_tests=yes
        ;;
      *)
        disable_jdk_tests=no
        ;;
    esac
  ],
  [
    disable_jdk_tests=no
  ])
  AC_MSG_RESULT([$disable_jdk_tests])
  AM_CONDITIONAL([DISABLE_JDK_TESTS], test x"${disable_jdk_tests}" = "xyes")
])

AC_DEFUN_ONCE([IT_CHECK_FOR_LCMS],
[
  AC_REQUIRE([IT_ENABLE_LCMS2])
  AC_MSG_CHECKING([whether to use the system LCMS install])
  AC_ARG_ENABLE([system-lcms],
	      [AS_HELP_STRING(--enable-system-lcms,use the system LCMS [[default=yes]])],
  [
    ENABLE_SYSTEM_LCMS="${enableval}"
  ],
  [
    if test x"${ENABLE_LCMS2}" = "xyes" -a x"${target_os}" = "xlinux-gnu" ; then
      ENABLE_SYSTEM_LCMS="yes" ;
    else
      ENABLE_SYSTEM_LCMS="no" ;
    fi;
  ])
  AC_MSG_RESULT(${ENABLE_SYSTEM_LCMS})
  if test x"${ENABLE_SYSTEM_LCMS}" = "xyes"; then
    dnl Check for LCMS2 headers and libraries.
    PKG_CHECK_MODULES(LCMS2, lcms2,[LCMS2_FOUND=yes],[LCMS2_FOUND=no])
    if test "x${LCMS2_FOUND}" = xno
    then
      AC_MSG_ERROR([Could not find LCMS 2; install it or build with --disable-system-lcms to use the in-tree copy.])
    fi
    AC_SUBST(LCMS2_CFLAGS)
    AC_SUBST(LCMS2_LIBS)
  fi
  AM_CONDITIONAL(USE_SYSTEM_LCMS, test x"${ENABLE_SYSTEM_LCMS}" = "xyes")
  AC_SUBST(ENABLE_SYSTEM_LCMS)
])

AC_DEFUN_ONCE([IT_CHECK_FOR_ZLIB],
[
  AC_MSG_CHECKING([whether to use the system zlib install])
  AC_ARG_ENABLE([system-zlib],
	      [AS_HELP_STRING(--enable-system-zlib,use the system ZLIB [[default=yes]])],
  [
    ENABLE_SYSTEM_ZLIB="${enableval}"
  ],
  [
    if test x"${target_os}" = "xlinux-gnu"; then
      ENABLE_SYSTEM_ZLIB="yes" ;
    else
      ENABLE_SYSTEM_ZLIB="no" ;
    fi
  ])
  AC_MSG_RESULT(${ENABLE_SYSTEM_ZLIB})
  if test x"${ENABLE_SYSTEM_ZLIB}" = "xyes"; then
    dnl Check for ZLIB headers and libraries.
    PKG_CHECK_MODULES(ZLIB, zlib,[ZLIB_FOUND=yes],[ZLIB_FOUND=no])
    if test "x${ZLIB_FOUND}" = xno
    then
      AC_CHECK_LIB(z, main, ZLIB_LIBS="-lz",
        [AC_MSG_ERROR([Could not find ZLIB; install ZLIB or build with --disable-system-zlib to use the in-tree copy.])])
    fi
    AC_SUBST(ZLIB_CFLAGS)
    AC_SUBST(ZLIB_LIBS)
  fi
  AM_CONDITIONAL(USE_SYSTEM_ZLIB, test x"${ENABLE_SYSTEM_ZLIB}" = "xyes")
  AC_SUBST(ENABLE_SYSTEM_ZLIB)
])

AC_DEFUN_ONCE([IT_CHECK_FOR_JPEG],
[
  AC_MSG_CHECKING([whether to use the system jpeg install])
  AC_ARG_ENABLE([system-jpeg],
	      [AS_HELP_STRING(--enable-system-jpeg,use the system libjpeg [[default=yes]])],
  [
    ENABLE_SYSTEM_JPEG="${enableval}"
  ],
  [
    if test x"${target_os}" = "xlinux-gnu"; then
      ENABLE_SYSTEM_JPEG="yes" ;
    else
      ENABLE_SYSTEM_JPEG="no" ;
    fi
  ])
  AC_MSG_RESULT(${ENABLE_SYSTEM_JPEG})
  if test x"${ENABLE_SYSTEM_JPEG}" = "xyes"; then
    dnl Check for JPEG headers and libraries.
    AC_CHECK_LIB([jpeg], [main],
        , [AC_MSG_ERROR([Could not find JPEG library; install JPEG or build with --disable-system-jpeg to use the in-tree copy.])])
    AC_CHECK_HEADER([jpeglib.h],
        , [AC_MSG_ERROR([Could not find JPEG header; install JPEG or build with --disable-system-jpeg to use the in-tree copy.])])
    JPEG_LIBS="-ljpeg"
    AC_SUBST(JPEG_LIBS)
  fi
  AM_CONDITIONAL(USE_SYSTEM_JPEG, test x"${ENABLE_SYSTEM_JPEG}" = "xyes")
  AC_SUBST(ENABLE_SYSTEM_JPEG)
])

AC_DEFUN_ONCE([IT_CHECK_FOR_PNG],
[
  AC_MSG_CHECKING([whether to use the system libpng install])
  AC_ARG_ENABLE([system-png],
	      [AS_HELP_STRING(--enable-system-png,use the system PNG [[default=yes]])],
  [
    ENABLE_SYSTEM_PNG="${enableval}"
  ],
  [
    if test x"${target_os}" = "xlinux-gnu"; then
      ENABLE_SYSTEM_PNG="yes" ;
    else
      ENABLE_SYSTEM_PNG="no" ;
    fi
  ])
  AC_MSG_RESULT(${ENABLE_SYSTEM_PNG})
  if test x"${ENABLE_SYSTEM_PNG}" = "xyes"; then
    dnl Check for PNG headers and libraries.
    PKG_CHECK_MODULES(PNG, libpng,[LIBPNG_FOUND=yes],[LIBPNG_FOUND=no])
    if test "x${LIBPNG_FOUND}" = xno
    then
      AC_MSG_ERROR([Could not find libpng; install libpng or build with --disable-system-png to use the in-tree copy.])
    fi
    AC_SUBST(PNG_CFLAGS)
    AC_SUBST(PNG_LIBS)
  fi
  AM_CONDITIONAL(USE_SYSTEM_PNG, test x"${ENABLE_SYSTEM_PNG}" = "xyes")
  AC_SUBST(ENABLE_SYSTEM_PNG)
])

AC_DEFUN_ONCE([IT_CHECK_FOR_GIF],
[
  AC_MSG_CHECKING([whether to use the system giflib install])
  AC_ARG_ENABLE([system-gif],
	      [AS_HELP_STRING(--enable-system-gif,use the system giflib [[default=yes]])],
  [
    ENABLE_SYSTEM_GIF="${enableval}"
  ],
  [
    if test x"${target_os}" = "xlinux-gnu"; then
      ENABLE_SYSTEM_GIF="yes" ;
    else
      ENABLE_SYSTEM_GIF="no" ;
    fi
  ])
  AC_MSG_RESULT(${ENABLE_SYSTEM_GIF})
  if test x"${ENABLE_SYSTEM_GIF}" = "xyes"; then
    dnl Check for GIF headers and libraries.
    AC_CHECK_LIB([gif], [main],
        , [AC_MSG_ERROR([Could not find GIF library; install GIF or build with --disable-system-gif to use the in-tree copy.])])
    AC_CHECK_HEADER([gif_lib.h],
        , [AC_MSG_ERROR([Could not find GIF header; install GIF or build with --disable-system-gif to use the in-tree copy.])])
    GIF_LIBS="-lgif"
    AC_SUBST(GIF_LIBS)
  fi
  AM_CONDITIONAL(USE_SYSTEM_GIF, test x"${ENABLE_SYSTEM_GIF}" = "xyes")
  AC_SUBST(ENABLE_SYSTEM_GIF)
])

AC_DEFUN_ONCE([IT_GET_PKGVERSION],
[
AC_MSG_CHECKING([for distribution package version])
AC_ARG_WITH([pkgversion],
        [AS_HELP_STRING([--with-pkgversion=PKG],
                        [Use PKG in the version string in addition to "IcedTea"])],
        [case "$withval" in
          yes) AC_MSG_ERROR([package version not specified]) ;;
          no)  PKGVERSION=none ;;
          *)   PKGVERSION="$withval" ;;
         esac],
        [PKGVERSION=none])
AC_MSG_RESULT([${PKGVERSION}])
AM_CONDITIONAL(HAS_PKGVERSION, test "x${PKGVERSION}" != "xnone") 
AC_SUBST(PKGVERSION)
])

AC_DEFUN_ONCE([IT_GET_LSB_DATA],
[
AC_REQUIRE([IT_GET_PKGVERSION])
AC_MSG_CHECKING([build identification])
if test -n "$LSB_RELEASE"; then
  lsb_info="$($LSB_RELEASE -ds | sed 's/^"//;s/"$//')"
  if test "x$PKGVERSION" = "xnone"; then
    DIST_ID="Built on $lsb_info ($(date))"
  else
    DIST_ID="$lsb_info, package $PKGVERSION"
  fi
  DIST_NAME="$($LSB_RELEASE -is | sed 's/^"//;s/"$//')"
else
  DIST_ID="Custom build ($(date))"
  DIST_NAME="$build_os"
fi
AC_MSG_RESULT([${DIST_ID}])
AC_SUBST(DIST_ID)
AC_SUBST(DIST_NAME)
])


AC_DEFUN_ONCE([IT_CHECK_FOR_MERCURIAL],
[
  AC_PATH_TOOL([HG],[hg])
  AC_SUBST([HG])
])

AC_DEFUN_ONCE([IT_OBTAIN_HG_REVISIONS],
[
  AC_REQUIRE([IT_CHECK_FOR_MERCURIAL])
  AC_REQUIRE([IT_WITH_OPENJDK_SRC_DIR])
  ICEDTEA_REVISION="none";
  JDK_REVISION="none";
  HOTSPOT_REVISION="none";
  if which ${HG} >&AS_MESSAGE_LOG_FD 2>&1; then
    AC_MSG_CHECKING([for IcedTea Mercurial revision ID])
    if test -e ${abs_top_srcdir}/.hg ; then 
      ICEDTEA_REVISION="r`(cd ${abs_top_srcdir}; ${HG} id -i)`" ; 
    fi ;
    AC_MSG_RESULT([${ICEDTEA_REVISION}])
    AC_SUBST([ICEDTEA_REVISION])
    AC_MSG_CHECKING([for JDK Mercurial revision ID])
    if test -e ${OPENJDK_SRC_DIR}/jdk/.hg ; then
      JDK_REVISION="r`(cd ${OPENJDK_SRC_DIR}/jdk; ${HG} id -i)`" ;
    fi ;
    AC_MSG_RESULT([${JDK_REVISION}])
    AC_SUBST([JDK_REVISION])
    AC_MSG_CHECKING([for HotSpot Mercurial revision ID])
    if test -e ${OPENJDK_SRC_DIR}/hotspot/.hg ; then \
      HOTSPOT_REVISION="r`(cd ${OPENJDK_SRC_DIR}/hotspot; ${HG} id -i)`" ;
    fi ; 
    AC_MSG_RESULT([${HOTSPOT_REVISION}])
    AC_SUBST([HOTSPOT_REVISION])
  fi;
  AM_CONDITIONAL([HAS_ICEDTEA_REVISION], test "x${ICEDTEA_REVISION}" != xnone)
  AM_CONDITIONAL([HAS_JDK_REVISION], test "x${JDK_REVISION}" != xnone)
  AM_CONDITIONAL([HAS_HOTSPOT_REVISION], test "x${HOTSPOT_REVISION}" != xnone)
])

AC_DEFUN_ONCE([IT_OBTAIN_DEFAULT_LIBDIR],
[
dnl find the system library directory
AC_CACHE_CHECK([for system library directory], [it_cv_default_libdir],
[
if test "x$LDD" = x; then
  it_cv_default_libdir=/usr/lib
else
  AC_LANG_CONFTEST([AC_LANG_PROGRAM([[]], [[]])])
  $CC conftest.c
  syslibdir=`$LDD a.out | sed -n '/libc\.so./s,.*=> */\(@<:@^/@:>@*\)/.*,\1,p'`
  rm -f a.out
  case x${syslibdir} in
    xlib|xlib64|xlib32|xlibn32) NSS_LIBDIR=/usr/${syslibdir};;
    *) it_cv_default_libdir=/usr/lib
  esac
fi
])
AC_SUBST([DEFAULT_LIBDIR], $it_cv_default_libdir)
])

AC_DEFUN_ONCE([IT_LOCATE_NSS],
[
AC_REQUIRE([IT_OBTAIN_DEFAULT_LIBDIR])
PKG_CHECK_MODULES(NSS, nss, [NSS_FOUND=yes], [NSS_FOUND=no])
if test "x${NSS_FOUND}" = xno
then
  if test "x${ENABLE_NSS}" = "xyes"
  then
    AC_MSG_ERROR([Could not find NSS.  Either install it or configure using --disable-nss.])
  else
    AC_MSG_WARN([Could not find NSS; using $DEFAULT_LIBDIR as its location.])
    NSS_LIBDIR=$DEFAULT_LIBDIR
  fi
else
  NSS_LIBDIR=`$PKG_CONFIG --variable=libdir nss`
fi
AC_SUBST(NSS_LIBDIR)
AC_CONFIG_FILES([nss.cfg])
])

AC_DEFUN([IT_JAVAH],[
AC_REQUIRE([IT_CHECK_JAVA_AND_JAVAC_WORK])
AC_CACHE_CHECK([if $JAVAH exhibits Classpath bug 39408], it_cv_cp39408_javah, [
SUPERCLASS=Test.java
SUBCLASS=TestImpl.java
SUB=$(echo $SUBCLASS|sed 's#\.java##')
SUBHEADER=$(echo $SUBCLASS|sed 's#\.java#.h#')
mkdir tmp.$$
cd tmp.$$
cat << \EOF > $SUPERCLASS
/* [#]line __oline__ "configure" */
public class Test 
{
  public static final int POTATO = 0;
  public static final int CABBAGE = 1;
}
EOF
cat << \EOF > $SUBCLASS
/* [#]line __oline__ "configure" */
public class TestImpl
  extends Test
{
  public native void doStuff();
}
EOF
if $JAVAC -cp . $JAVACFLAGS $SUBCLASS >&AS_MESSAGE_LOG_FD 2>&1; then
  if $JAVAH -classpath . $SUB >&AS_MESSAGE_LOG_FD 2>&1; then
    if cat $SUBHEADER | grep POTATO >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_cp39408_javah=no;
    else
      it_cv_cp39408_javah=yes;
    fi
  else
    AC_MSG_ERROR([The Java header generator $JAVAH failed])
    echo "configure: failed program was:" >&AC_FD_CC
    cat $SUBCLASS >&AC_FD_CC
  fi
else
  AC_MSG_ERROR([The Java compiler $JAVAC failed])
  echo "configure: failed program was:" >&AC_FD_CC
  cat $SUBCLASS >&AC_FD_CC
fi
])
AC_CACHE_CHECK([if $JAVAH exhibits Classpath bug 40188], it_cv_cp40188_javah, [
  if test -e $SUBHEADER ; then
    if cat $SUBHEADER | grep TestImpl_POTATO >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_cp40188_javah=no;
    else
      it_cv_cp40188_javah=yes;
    fi
  fi
])
rm -f $SUBCLASS $SUPERCLASS $SUBHEADER *.class
cd ..
rmdir tmp.$$
AM_CONDITIONAL([CP39408_JAVAH], test x"${it_cv_cp39408_javah}" = "xyes")
AM_CONDITIONAL([CP40188_JAVAH], test x"${it_cv_cp40188_javah}" = "xyes")
AC_PROVIDE([$0])dnl
])

dnl Generic macro to check for a Java method
dnl Takes five arguments: the name of the macro,
dnl the name of the method, the name of the class,
dnl the method signature and an example call to the
dnl method.  The macro name is usually the name of
dnl the class with '.' replaced by '_' and all letters
dnl capitalised.
dnl e.g. IT_CHECK_FOR_METHOD([JAVA_UTIL_REGEX_MATCHER_QUOTEREPLACEMENT],[java.util.regex.Matcher.quoteReplacement],[java.util.rgex.Matcher],["quoteReplacement",String.class],java.util.regex.Matcher.quoteReplacement("Blah"))
AC_DEFUN([IT_CHECK_FOR_METHOD],[
AC_REQUIRE([IT_CHECK_JAVA_AND_JAVAC_WORK])
AC_CACHE_CHECK([if $2 is missing], it_cv_$1, [
CLASS=Test.java
BYTECODE=$(echo $CLASS|sed 's#\.java##')
mkdir tmp.$$
cd tmp.$$
cat << \EOF > $CLASS
[/* [#]line __oline__ "configure" */
import java.lang.reflect.Method;

public class Test
{
  public static void main(String[] args)
  {
    Class<?> cl = $3.class;
    try
      {
        Method m = cl.getDeclaredMethod($4);
	System.err.println("Method found: " + m);
      }
    catch (NoSuchMethodException e)
      {
        System.exit(-1);
      }
  }

  public void dontRun()
  {
    $5;
  }

}
]
EOF
if $JAVAC -cp . $JAVACFLAGS -source 5 -target 5 -nowarn $CLASS >&AS_MESSAGE_LOG_FD 2>&1; then
  if $JAVA -classpath . $BYTECODE >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_$1=no;
  else
      it_cv_$1=yes;
  fi
else
  it_cv_$1=yes;
fi
])
rm -f $CLASS *.class
cd ..
rmdir tmp.$$
AM_CONDITIONAL([LACKS_$1], test x"${it_cv_$1}" = "xyes")
AC_PROVIDE([$0])dnl
])

AC_DEFUN([IT_CHECK_IF_DOWNLOADING],
[
  AC_MSG_CHECKING([whether to download tarballs])
  AC_ARG_ENABLE([downloading],
	      [AS_HELP_STRING(--disable-downloading,don't download tarballs [[default=no]])],
  [
    case "${enableval}" in
      no)
	enable_downloading=no
        ;;
      *)
        enable_downloading=yes
        ;;
    esac
  ],
  [
        enable_downloading=yes
  ])
  AC_MSG_RESULT([${enable_downloading}])
  AM_CONDITIONAL([DOWNLOADING], test x"${enable_downloading}" = "xyes")
  AC_SUBST([enable_downloading])
])

AC_DEFUN([IT_USING_ECJ],[
AC_CACHE_CHECK([if we are using ecj as javac], it_cv_ecj, [
if $JAVAC -version 2>&1| grep '^Eclipse' >&AS_MESSAGE_LOG_FD ; then
  it_cv_ecj=yes;
else
  it_cv_ecj=no;
fi
])
USING_ECJ=$it_cv_ecj
AC_SUBST(USING_ECJ)
AC_PROVIDE([$0])dnl
])

dnl Generic macro to check for a Java constructor
dnl Takes four arguments: the name of the macro,
dnl the name of the class, the method signature
dnl and an example call to the method.  The macro name
dnl is usually the name of the class with '.'
dnl replaced by '_' and all letters capitalised.
dnl e.g. IT_CHECK_FOR_CONSTRUCTOR([JAVAX_MANAGEMENT_STANDARDMBEAN_MXBEAN_TWO_ARG],[javax.management.StandardMBean],[Class.class,Boolean.TYPE],[Object.class, true])
AC_DEFUN([IT_CHECK_FOR_CONSTRUCTOR],[
AC_REQUIRE([IT_CHECK_JAVA_AND_JAVAC_WORK])
AC_CACHE_CHECK([if $2($3) is missing], it_cv_$1, [
CLASS=Test.java
BYTECODE=$(echo $CLASS|sed 's#\.java##')
mkdir tmp.$$
cd tmp.$$
cat << \EOF > $CLASS
[/* [#]line __oline__ "configure" */
import java.lang.reflect.Constructor;

public class Test
{
  public static void main(String[] args)
  {
    Class<?> cl = $2.class;
    try
      {
      	Constructor<?> cons = cl.getDeclaredConstructor($3);
	System.err.println("Constructor found: " + cons);
      }
    catch (NoSuchMethodException e)
      {
        System.exit(-1);
      }
  }

  private class TestCons extends $2
  {
     TestCons()
     {
       super($4);
     }
  }

}

]
EOF
if $JAVAC -cp . $JAVACFLAGS -source 5 -target 5 -nowarn $CLASS >&AS_MESSAGE_LOG_FD 2>&1; then
  if $JAVA -classpath . $BYTECODE >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_$1=no;
  else
      it_cv_$1=yes;
  fi
else
  it_cv_$1=yes;
fi
])
rm -f $CLASS *.class
cd ..
rmdir tmp.$$
AM_CONDITIONAL([LACKS_$1], test x"${it_cv_$1}" = "xyes")
AC_PROVIDE([$0])dnl
])

dnl Generic macro to check for a Java field
dnl Takes five arguments: the name of the macro,
dnl the name of the field and the name of the class.
dnl The macro name is usually the name of the class
dnl with '.' replaced by '_' and all letters
dnl capitalised.
dnl e.g. IT_CHECK_FOR_FIELD([JAVAX_SECURITY_SASL_SASL_CREDENTIALS],
dnl [CREDENTIALS], [javax.security.sasl.Sasl])
AC_DEFUN([IT_CHECK_FOR_STATIC_FIELD],[
AC_REQUIRE([IT_CHECK_JAVA_AND_JAVAC_WORK])
AC_CACHE_CHECK([if $3.$2 is missing], it_cv_$1, [
CLASS=Test.java
BYTECODE=$(echo $CLASS|sed 's#\.java##')
mkdir tmp.$$
cd tmp.$$
cat << \EOF > $CLASS
[/* [#]line __oline__ "configure" */
import java.lang.reflect.Field;

public class Test
{
  public static void main(String[] args)
  {
    Class<?> cl = $3.class;
    try
      {
        Field f = cl.getDeclaredField("$2");
	System.err.println("Field found: " + f);
	System.err.println("Field value: " + $3.$2);
      }
    catch (NoSuchFieldException e)
      {
        System.exit(-1);
      }
  }

}
]
EOF
if $JAVAC -cp . $JAVACFLAGS -source 5 -target 5 -nowarn $CLASS >&AS_MESSAGE_LOG_FD 2>&1; then
  if $JAVA -classpath . $BYTECODE >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_$1=no;
  else
      it_cv_$1=yes;
  fi
else
  it_cv_$1=yes;
fi
])
rm -f $CLASS *.class
cd ..
rmdir tmp.$$
AM_CONDITIONAL([LACKS_$1], test x"${it_cv_$1}" = "xyes")
AC_PROVIDE([$0])dnl
])

AC_DEFUN_ONCE([IT_USE_BOOTSTRAP_TOOLS],
[
  AC_MSG_CHECKING([whether to disable the use of bootstrap tools for bootstrapping])
  AC_ARG_ENABLE([bootstrap-tools],
                [AS_HELP_STRING(--disable-bootstrap-tools,
		disable the use of bootstrap tools for bootstrapping [[default=no]])],
  [
    case "${enableval}" in
      no)
        disable_bootstrap_tools=yes
        ;;
      *)
        disable_bootstrap_tools=no
        ;;
    esac
  ],
  [
      disable_bootstrap_tools=no;
  ])
  AC_MSG_RESULT([$disable_bootstrap_tools])
  AM_CONDITIONAL([DISABLE_BOOTSTRAP_TOOLS], test x"${disable_bootstrap_tools}" = "xyes")
])

AC_DEFUN_ONCE([IT_CHECK_FOR_XBOOTCLASSPATH],
[
  AC_REQUIRE([IT_CHECK_JAVA_AND_JAVAC_WORK])
  AC_CACHE_CHECK([if the VM supports -Xbootclasspath], it_cv_xbootclasspath_works, [
  CLASS=Test.java
  BYTECODE=$(echo $CLASS|sed 's#\.java##')
  mkdir tmp.$$
  cd tmp.$$
  cat << \EOF > $CLASS
[/* [#]line __oline__ "configure" */

public class Test
{
    public static void main(String[] args)
    {
      System.out.println("Hello World!");
    }
}]
EOF
  mkdir build
  if $JAVAC -d build -cp . $JAVACFLAGS -source 5 -target 5 $CLASS >&AS_MESSAGE_LOG_FD 2>&1; then
    if $JAVA -Xbootclasspath/p:build $BYTECODE >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_xbootclasspath_works=yes;
    else
      it_cv_xbootclasspath_works=no;
    fi
  else
    it_cv_xbootclasspath_works=no;
  fi
  rm -f $CLASS build/*.class
  rmdir build
  cd ..
  rmdir tmp.$$
  ])
  AC_PROVIDE([$0])dnl
  AM_CONDITIONAL([VM_SUPPORTS_XBOOTCLASSPATH], test x"${it_cv_xbootclasspath_works}" = "xyes")
])

AC_DEFUN_ONCE([IT_HAS_PAX],
[
  AC_MSG_CHECKING([if a PaX kernel is in use])
  if grep '^PaX' /proc/self/status >&AS_MESSAGE_LOG_FD 2>&1; then
    pax_active=yes;
  else
    pax_active=no;
  fi
  AC_MSG_RESULT([${pax_active}])
  AM_CONDITIONAL([USING_PAX], test x"${pax_active}" = "xyes")
])

AC_DEFUN_ONCE([IT_WITH_PAX],
[
  AC_REQUIRE([IT_HAS_PAX])
  PAX_DEFAULT=/usr/sbin/paxmark.sh
  AC_MSG_CHECKING([if a PaX utility was specified])
  AC_ARG_WITH([pax],
              [AS_HELP_STRING(--with-pax=COMMAND,the command used for pax marking)],
  [
    PAX_COMMAND="${withval}"
  ],
  [ 
    PAX_COMMAND=${pax_active}
  ])
  if test "x${PAX_COMMAND}" == "xyes"; then
    AC_MSG_RESULT([no])
    PAX_COMMAND=${PAX_DEFAULT}
    AC_MSG_NOTICE([PaX enabled but no tool specified; using ${PAX_DEFAULT}])
  else
    AC_MSG_RESULT(${PAX_COMMAND})
  fi
  if test "x${PAX_COMMAND}" != "xno"; then
    AC_MSG_CHECKING([if $PAX_COMMAND is a valid executable file])
    if test -x "${PAX_COMMAND}" && test -f "${PAX_COMMAND}"; then
      AC_MSG_RESULT([yes])
    else
      AC_MSG_RESULT([no])
      PAX_COMMAND=""
      AC_PATH_PROG(PAX_COMMAND, "paxmark.sh")
      if test -z "${PAX_COMMAND}"; then
        AC_PATH_PROG(PAX_COMMAND, "paxctl-ng")
      fi
      if test -z "${PAX_COMMAND}"; then
        AC_PATH_PROG(PAX_COMMAND, "chpax")
      fi
      if test -z "${PAX_COMMAND}"; then
        AC_PATH_PROG(PAX_COMMAND, "paxctl")
      fi
    fi
  else
    PAX_COMMAND=""
  fi
  if test -z "${PAX_COMMAND}"; then
    if test "x${pax_active}" = "xyes"; then
      AC_MSG_ERROR("No PaX utility found and running on a PaX kernel.")
    else
      AC_MSG_WARN("No PaX utility found.")
    fi
  fi
  if test -z "${PAX_COMMAND}"; then
    PAX_COMMAND="not specified"
    PAX_COMMAND_ARGS="not specified"
  else
    AC_MSG_CHECKING([which options to pass to ${PAX_COMMAND}])
    case "${host_cpu}" in
      i?86)
        PAX_COMMAND_ARGS="-msp"
        ;;
      *)
        PAX_COMMAND_ARGS="-m"
        ;;
    esac
    AC_MSG_RESULT(${PAX_COMMAND_ARGS})
  fi
  AM_CONDITIONAL(WITH_PAX, test "x${PAX_COMMAND}" != "xnot specified")
  AC_SUBST(PAX_COMMAND)
  AC_SUBST(PAX_COMMAND_ARGS)
])

AC_DEFUN([IT_USING_CACAO],[
  AC_REQUIRE([IT_FIND_JAVA])
  AC_CACHE_CHECK([if we are using CACAO as the build VM], it_cv_cacao, [
  if $JAVA -version 2>&1| grep '^CACAO' >&AS_MESSAGE_LOG_FD ; then
    it_cv_cacao=yes;
  else
    it_cv_cacao=no;
  fi
  ])
  USING_CACAO=$it_cv_cacao
  AC_SUBST(USING_CACAO)
  AM_CONDITIONAL(USING_CACAO, test "x${USING_CACAO}" = "xyes")
  AC_PROVIDE([$0])dnl
])

AC_DEFUN_ONCE([IT_ENABLE_LCMS2],
[
  AC_MSG_CHECKING([whether to enable the use of LCMS2])
  AC_ARG_ENABLE([lcms2],
	      [AS_HELP_STRING(--enable-lcms2,use LCMS 2 backport from OpenJDK 7 [[default=yes]])],
  [
    ENABLE_LCMS2="${enableval}"
  ],
  [
    ENABLE_LCMS2=yes
  ])

  AC_MSG_RESULT(${ENABLE_LCMS2})
  AM_CONDITIONAL(ENABLE_LCMS2, test x"${ENABLE_LCMS2}" = "xyes")
  AC_SUBST(ENABLE_LCMS2)
])

dnl Check for Kerberos library in order to lookup cache location at runtime.
AC_DEFUN_ONCE([IT_CHECK_FOR_KERBEROS],
[
  AC_MSG_CHECKING([whether to use the system Kerberos install])
  AC_ARG_ENABLE([system-kerberos],
	      [AS_HELP_STRING(--enable-system-kerberos,use the system kerberos [[default=yes]])],
  [
    ENABLE_SYSTEM_KERBEROS="${enableval}"
  ],
  [
    ENABLE_SYSTEM_KERBEROS="yes"
  ])
  AC_MSG_RESULT(${ENABLE_SYSTEM_KERBEROS})
  if test x"${ENABLE_SYSTEM_KERBEROS}" = "xyes"; then
    dnl Check for krb5 header and library.
    AC_CHECK_LIB([krb5], [krb5_cc_default],
        , [AC_MSG_ERROR([Could not find Kerberos library; install Kerberos or build with --disable-system-kerberos to use the default cache location.])])
    AC_CHECK_HEADER([krb5.h],
        , [AC_MSG_ERROR([Could not find Kerberos header; install Kerberos or build with --disable-system-kerberos to use the default cache location.])])
    KRB5_LIBS="-lkrb5"
    AC_SUBST(KRB5_LIBS)
  fi
  AM_CONDITIONAL(USE_SYSTEM_KERBEROS, test x"${ENABLE_SYSTEM_KERBEROS}" = "xyes")
  AC_SUBST(ENABLE_SYSTEM_KERBEROS)
])

AC_DEFUN([IT_ENABLE_JAR_COMPRESSION],
[
  AC_MSG_CHECKING([whether to enable JAR compression])
  AC_ARG_ENABLE([jar-compression],
                [AS_HELP_STRING(--enable-jar-compression,compress built jars [[default=yes]])],
  [
    case "${enableval}" in
      no)
        enable_jar_compression=no
        ;;
      *)
        enable_jar_compression=yes
        ;;
    esac
  ],
  [
    enable_jar_compression=yes
  ])
  AC_MSG_RESULT([$enable_jar_compression])
  AM_CONDITIONAL([ENABLE_JAR_COMPRESSION], test x"${enable_jar_compression}" = "xyes")
])

AC_DEFUN([IT_ENABLE_WERROR],
[
  AC_MSG_CHECKING([whether to enable -Werror])
  AC_ARG_ENABLE([Werror],
                [AS_HELP_STRING(--enable-Werror,build with -Werror [[default=no]])],
  [
    case "${enableval}" in
      yes)
        enable_werror=yes
        ;;
      *)
        enable_werror=no
        ;;
    esac
  ],
  [
    enable_werror=no
  ])
  AC_MSG_RESULT([$enable_werror])
  AM_CONDITIONAL([ENABLE_WERROR], test x"${enable_werror}" = "xyes")
])

AC_DEFUN_ONCE([IT_PR64174_CHECK],[
AC_REQUIRE([IT_CHECK_JAVA_AND_JAVAC_WORK])
AC_CACHE_CHECK([if java.text.SimpleDateFormat exhibits Classpath bug 64174], it_cv_cp64174, [
  CLASS=Test.java
  BYTECODE=$(echo $CLASS|sed 's#\.java##')
  mkdir tmp.$$
  cd tmp.$$
  cat << \EOF > $CLASS
[/* [#]line __oline__ "configure" */
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

public class Test
{
  public static void main(String[] args)
    throws ParseException
  {
    SimpleDateFormat format;

    format = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss", Locale.US);
    format.setTimeZone(TimeZone.getTimeZone("GMT"));
    format.setLenient(false);
    System.out.println(format.parse("2014-12-31-22-00-00"));
  }
}]
EOF
  if $JAVAC -cp . $JAVACFLAGS -source 5 -target 5 $CLASS >&AS_MESSAGE_LOG_FD 2>&1; then
    if $JAVA -classpath . $BYTECODE >&AS_MESSAGE_LOG_FD 2>&1; then
      it_cv_cp64174=no;
    else
      it_cv_cp64174=yes;
    fi
  else
    it_cv_cp64174=yes;
  fi
  rm -f $CLASS *.class
  cd ..
  rmdir tmp.$$
  ])
AM_CONDITIONAL([CP64174], test x"${it_cv_cp64174}" = "xyes")
AC_PROVIDE([$0])dnl
])

AC_DEFUN_ONCE([IT_ENABLE_NON_NSS_CURVES],
[
  AC_MSG_CHECKING([whether to enable elliptic curves beyond those supported by NSS])
  AC_ARG_ENABLE([non-nss-curves],
	      [AS_HELP_STRING(--enable-non-nss-curves,register curves beyond the 3 NSS defines [[default=no]])],
  [
    case "${enableval}" in
      no)
	ENABLE_NON_NSS_CURVES=no
        ;;
      *)
        ENABLE_NON_NSS_CURVES=yes
        ;;
    esac
  ],
  [
    ENABLE_NON_NSS_CURVES="no"
  ])
  AC_MSG_RESULT(${ENABLE_NON_NSS_CURVES})
  AM_CONDITIONAL(USE_NON_NSS_CURVES, test x"${ENABLE_NON_NSS_CURVES}" = "xyes")
  AC_SUBST(ENABLE_NON_NSS_CURVES)
])

AC_DEFUN_ONCE([IT_WITH_FONTS_DIR],
[
  FONTS_DEFAULT=/usr/share/fonts
  AC_MSG_CHECKING([where fonts are stored])
  AC_ARG_WITH([fonts-dir],
              [AS_HELP_STRING(--with-fonts-dir=PATH,fonts [[DATAROOTDIR/fonts]])],
  [
    fontdir=${withval}
  ],
  [ 
    fontdir=${FONTS_DEFAULT}
  ])
  AC_MSG_RESULT(${fontdir})
  if test "x${fontdir}" = "xyes" -o "x${fontdir}" = "xno"; then
    AC_MSG_NOTICE([No font directory specified; using ${FONTS_DEFAULT}])
    fontdir=${FONTS_DEFAULT} ;
  fi
  AC_MSG_CHECKING([if $fontdir is a valid directory])
  if test -d "${fontdir}" ; then
    AC_MSG_RESULT([yes])
  else
    AC_MSG_RESULT([no])
    AC_MSG_WARN([No valid font directory found])
  fi
  AC_SUBST(fontdir)
])
