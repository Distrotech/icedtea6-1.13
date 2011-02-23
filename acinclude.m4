AC_DEFUN([IT_SET_ARCH_SETTINGS],
[
  case "${host_cpu}" in
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
  case "${host_os}" in
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
      AC_MSG_ERROR([unsupported operating system ${host_os}])
      ;;
  esac
  AC_SUBST(BUILD_OS_DIR)
  AC_SUBST(OS_PATH)
])

AC_DEFUN([IT_FIND_JAVAC],
[
  JAVAC=${SYSTEM_JDK_DIR}/bin/javac
  IT_FIND_JAVAC
  IT_FIND_ECJ

  AC_SUBST(JAVAC)
])

AC_DEFUN([IT_FIND_ECJ],
[
  AC_ARG_WITH([ecj],
	      [AS_HELP_STRING(--with-ecj,bytecode compilation with ecj)],
  [
    if test "x${withval}" != x && test "x${withval}" != xyes && test "x${withval}" != xno; then
      IT_CHECK_ECJ(${withval})
    else
      if test "x${withval}" != xno; then
        IT_CHECK_ECJ
      fi
    fi
  ],
  [ 
    IT_CHECK_ECJ
  ])
  if test "x${JAVAC}" = "x"; then
    if test "x{ECJ}" != "x"; then
      JAVAC="${ECJ} -nowarn"
    fi
  fi
])

AC_DEFUN([IT_CHECK_ECJ],
[
  if test "x$1" != x; then
    if test -f "$1"; then
      AC_MSG_CHECKING(for ecj)
      ECJ="$1"
      AC_MSG_RESULT(${ECJ})
    else
      AC_PATH_PROG(ECJ, "$1")
    fi
  else
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
  fi
])

AC_DEFUN([IT_FIND_JAVAC],
[
  AC_ARG_WITH([javac],
	      [AS_HELP_STRING(--with-javac,bytecode compilation with javac)],
  [
    if test "x${withval}" != x && test "x${withval}" != xyes && test "x${withval}" != xno; then
      IT_CHECK_JAVAC(${withval})
    else
      if test "x${withval}" != xno; then
        IT_CHECK_JAVAC
      fi
    fi
  ],
  [ 
    IT_CHECK_JAVAC
  ])
])

AC_DEFUN([IT_CHECK_JAVAC],
[
  if test "x$1" != x; then
    if test -f "$1"; then
      AC_MSG_CHECKING(for javac)
      JAVAC="$1"
      AC_MSG_RESULT(${JAVAC})
    else
      AC_PATH_PROG(JAVAC, "$1")
    fi
  else
    AC_PATH_PROG(JAVAC, "javac")
  fi
])

AC_DEFUN([IT_FIND_JAVA],
[
  AC_MSG_CHECKING(for java)
  AC_ARG_WITH([java],
              [AS_HELP_STRING(--with-java,specify location of the 1.5 java vm)],
  [
    JAVA="${withval}"
  ],
  [
    JAVA=${SYSTEM_JDK_DIR}/bin/java
  ])
  if ! test -f "${JAVA}"; then
    AC_PATH_PROG(JAVA, "${JAVA}")
  fi
  if test -z "${JAVA}"; then
    AC_PATH_PROG(JAVA, "gij")
  fi
  if test -z "${JAVA}"; then
    AC_PATH_PROG(JAVA, "java")
  fi
  if test -z "${JAVA}"; then
    AC_MSG_ERROR("A 1.5-compatible Java VM is required.")
  fi
  AC_MSG_RESULT(${JAVA})
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
  AC_MSG_CHECKING([for javah])
  AC_ARG_WITH([javah],
              [AS_HELP_STRING(--with-javah,specify location of the Java header generator)],
  [
    JAVAH="${withval}"
  ],
  [
    JAVAH=${SYSTEM_JDK_DIR}/bin/javah
  ])
  if ! test -f "${JAVAH}"; then
    AC_PATH_PROG(JAVAH, "${JAVAH}")
  fi
  if test -z "${JAVAH}"; then
    AC_PATH_PROG(JAVAH, "gjavah")
  fi
  if test -z "${JAVAH}"; then
    AC_PATH_PROG(JAVAH, "javah")
  fi
  if test -z "${JAVAH}"; then
    AC_MSG_ERROR("A Java header generator was not found.")
  fi
  AC_MSG_RESULT(${JAVAH})
  AC_SUBST(JAVAH)
])

AC_DEFUN([IT_FIND_JAR],
[
  AC_MSG_CHECKING([for jar])
  AC_ARG_WITH([jar],
              [AS_HELP_STRING(--with-jar,specify location of Java archive tool (jar))],
  [
    JAR="${withval}"
  ],
  [
    JAR=${SYSTEM_JDK_DIR}/bin/jar
  ])
  if ! test -f "${JAR}"; then
    AC_PATH_PROG(JAR, "${JAR}")
  fi
  if test -z "${JAR}"; then
    AC_PATH_PROG(JAR, "gjar")
  fi
  if test -z "${JAR}"; then
    AC_PATH_PROG(JAR, "jar")
  fi
  if test -z "${JAR}"; then
    AC_MSG_ERROR("No Java archive tool was found.")
  fi
  AC_MSG_RESULT(${JAR})
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
  AC_MSG_CHECKING(for rmic)
  AC_ARG_WITH([rmic],
              [AS_HELP_STRING(--with-rmic,specify location of the RMI compiler)],
  [
    RMIC="${withval}"
  ],
  [
    RMIC=${SYSTEM_JDK_DIR}/bin/rmic
  ])
  if ! test -f "${RMIC}"; then
    AC_PATH_PROG(RMIC, "${RMIC}")
  fi
  if test -z "${RMIC}"; then
    AC_PATH_PROG(RMIC, "grmic")
  fi
  if test -z "${RMIC}"; then
    AC_PATH_PROG(RMIC, "rmic")
  fi
  if test -z "${RMIC}"; then
    AC_MSG_ERROR("An RMI compiler was not found.")
  fi
  AC_MSG_RESULT(${RMIC})
  AC_SUBST(RMIC)
])

AC_DEFUN([IT_FIND_NATIVE2ASCII],
[
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
  AC_MSG_CHECKING([if $NATIVE2ASCII is a valid executable])
  if ! test -x "${NATIVE2ASCII}"; then
    AC_MSG_RESULT([no])
    NATIVE2ASCII=""
    AC_PATH_PROG(NATIVE2ASCII, "native2ascii")
    if test -z "${NATIVE2ASCII}"; then
      AC_PATH_PROG(NATIVE2ASCII, "gnative2ascii")
    fi
    if test -z "${NATIVE2ASCII}"; then
      AC_MSG_ERROR("A native2ascii converter was not found.")
    fi
  else
    AC_MSG_RESULT([yes])
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
    AM_CONDITIONAL(USE_ALT_OPENJDK_SRC_ZIP, test x = x)
  ],
  [ 
    ALT_OPENJDK_SRC_ZIP="not specified"
    AM_CONDITIONAL(USE_ALT_OPENJDK_SRC_ZIP, test x != x)
  ])
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

AC_DEFUN([IT_FIND_XALAN2_JAR],
[
  AC_MSG_CHECKING([for a xalan2 jar])
  AC_ARG_WITH([xalan2-jar],
              [AS_HELP_STRING(--with-xalan2-jar,specify location of the xalan2 jar)],
  [
    if test -f "${withval}" ; then
      XALAN2_JAR="${withval}"
    fi
  ],
  [
    XALAN2_JAR=
  ])
  if test -z "${XALAN2_JAR}"; then
    if test -e "/usr/share/java/xalan-j2.jar"; then
      XALAN2_JAR=/usr/share/java/xalan-j2.jar
    elif test -e "/usr/share/java/xalan2.jar"; then
      XALAN2_JAR=/usr/share/java/xalan2.jar
    elif test -e "/usr/share/xalan/lib/xalan.jar"; then
      XALAN2_JAR=/usr/share/xalan/lib/xalan.jar
    else
      AC_MSG_RESULT(no)
    fi
  fi
  if test -z "${XALAN2_JAR}"; then
    AC_MSG_ERROR("A xalan2 jar was not found.")
  fi
  AC_MSG_RESULT(${XALAN2_JAR})
  AC_SUBST(XALAN2_JAR)
])

AC_DEFUN([IT_FIND_XALAN2_SERIALIZER_JAR],
[
  AC_MSG_CHECKING([for a xalan2 serializer jar])
  AC_ARG_WITH([xalan2-serializer-jar],
              [AS_HELP_STRING(--with-xalan2-serializer-jar,specify location of the xalan2-serializer jar)],
  [
    if test -f "${withval}" ; then
      XALAN2_SERIALIZER_JAR="${withval}"
    fi
  ],
  [
    XALAN2_SERIALIZER_JAR=
  ])
  if test -z "${XALAN2_SERIALIZER_JAR}"; then
    if test -e "/usr/share/java/xalan-j2-serializer.jar"; then
      XALAN2_SERIALIZER_JAR=/usr/share/java/xalan-j2-serializer.jar
    elif test -e "/usr/share/xalan-serializer/lib/serializer.jar"; then
      XALAN2_SERIALIZER_JAR=/usr/share/xalan-serializer/lib/serializer.jar
    elif test -e "/usr/share/java/serializer.jar"; then
      XALAN2_SERIALIZER_JAR=/usr/share/java/serializer.jar
    else
      AC_MSG_RESULT(no)
    fi
  fi
  if test -z "${XALAN2_SERIALIZER_JAR}"; then
    AC_MSG_ERROR("A xalan2-serializer jar was not found.")
  fi
  AC_MSG_RESULT(${XALAN2_SERIALIZER_JAR})
  AC_SUBST(XALAN2_SERIALIZER_JAR)
])

AC_DEFUN([IT_FIND_XERCES2_JAR],
[
  AC_MSG_CHECKING([for a xerces2 jar])
  AC_ARG_WITH([xerces2-jar],
              [AS_HELP_STRING(--with-xerces2-jar,specify location of the xerces2 jar)],
  [
    if test -f "${withval}" ; then
      XERCES2_JAR="${withval}"
    fi
  ],
  [
    XERCES2_JAR=
  ])
  if test -z "${XERCES2_JAR}"; then
    if test -e "/usr/share/java/xerces-j2.jar"; then
      XERCES2_JAR=/usr/share/java/xerces-j2.jar
    elif test -e "/usr/share/java/xerces2.jar"; then
      XERCES2_JAR=/usr/share/java/xerces2.jar
    elif test -e "/usr/share/xerces-2/lib/xercesImpl.jar"; then
      XERCES2_JAR=/usr/share/xerces-2/lib/xercesImpl.jar
    elif test -e "/usr/share/java/xercesImpl.jar"; then
      XERCES2_JAR=/usr/share/java/xercesImpl.jar
    else
      AC_MSG_RESULT(no)
    fi
  fi
  if test -z "${XERCES2_JAR}"; then
    AC_MSG_ERROR("A xerces2 jar was not found.")
  fi
  AC_MSG_RESULT(${XERCES2_JAR})
  AC_SUBST(XERCES2_JAR)
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

AC_DEFUN([IT_ENABLE_ZERO_BUILD],
[
  AC_REQUIRE([IT_SET_ARCH_SETTINGS])
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
    else
      case "${host}" in
        i?86-*-*) ;;
        sparc*-*-*) ;;
        x86_64-*-*) ;;
        *)
          if test "x${ENABLE_CACAO}" != xno || \
	     test "x${ENABLE_JAMVM}" = xyes; then
            use_zero=no
          else
            use_zero=yes
          fi
          ;;
      esac
    fi
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

AC_DEFUN([IT_SET_SHARK_BUILD],
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

AC_DEFUN([IT_CHECK_ENABLE_JAMVM],
[
  AC_MSG_CHECKING(whether to use JamVM as VM)
  AC_ARG_ENABLE([jamvm],
	      [AS_HELP_STRING(--enable-jamvm,use JamVM as VM [[default=no]])],
  [
    ENABLE_JAMVM="${enableval}"
  ],
  [
    ENABLE_JAMVM=no
  ])

  AC_MSG_RESULT(${ENABLE_JAMVM})
  AM_CONDITIONAL(ENABLE_JAMVM, test x"${ENABLE_JAMVM}" = "xyes")
  AC_SUBST(ENABLE_JAMVM)
])

AC_DEFUN([IT_CHECK_WITH_JAMVM_SRC_ZIP],
[
  AC_MSG_CHECKING([for a JamVM source zip])
  AC_ARG_WITH([jamvm-src-zip],
	      [AS_HELP_STRING(--with-jamvm-src-zip,specify the location of the JamVM source zip)],
  [
    ALT_JAMVM_SRC_ZIP=${withval}
    AM_CONDITIONAL(USE_ALT_JAMVM_SRC_ZIP, test x = x)
  ],
  [
    ALT_JAMVM_SRC_ZIP="not specified"
    AM_CONDITIONAL(USE_ALT_JAMVM_SRC_ZIP, test x != x)
  ])
  AC_MSG_RESULT(${ALT_JAMVM_SRC_ZIP})
  AC_SUBST(ALT_JAMVM_SRC_ZIP)
])

AC_DEFUN([IT_CHECK_ENABLE_CACAO],
[
  AC_MSG_CHECKING(whether to use CACAO as VM)
  AC_ARG_ENABLE([cacao],
	      [AS_HELP_STRING(--enable-cacao,use CACAO as VM [[default=no]])],
  [
    ENABLE_CACAO="${enableval}"
  ],
  [
    ENABLE_CACAO=no
  ])

  AC_MSG_RESULT(${ENABLE_CACAO})
  AM_CONDITIONAL(ENABLE_CACAO, test x"${ENABLE_CACAO}" = "xyes")
  AC_SUBST(ENABLE_CACAO)
])

AC_DEFUN([IT_CHECK_WITH_CACAO_HOME],
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

AC_DEFUN([IT_CHECK_WITH_CACAO_SRC_ZIP],
[
  AC_MSG_CHECKING([for a CACAO source zip])
  AC_ARG_WITH([cacao-src-zip],
              [AS_HELP_STRING(--with-cacao-src-zip,specify the location of the CACAO source zip)],
  [
    ALT_CACAO_SRC_ZIP=${withval}
    AM_CONDITIONAL(USE_ALT_CACAO_SRC_ZIP, test x = x)
  ],
  [ 
    ALT_CACAO_SRC_ZIP="not specified"
    AM_CONDITIONAL(USE_ALT_CACAO_SRC_ZIP, test x != x)
  ])
  AC_MSG_RESULT(${ALT_CACAO_SRC_ZIP})
  AC_SUBST(ALT_CACAO_SRC_ZIP)
])

AC_DEFUN([IT_CHECK_WITH_CACAO_SRC_DIR],
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

AC_DEFUN([IT_CHECK_WITH_GCJ],
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

AC_DEFUN([IT_CHECK_WITH_HOTSPOT_BUILD],
[
  ORIGINAL_BUILD="original"
  ALTERNATE_BUILD="hs20"
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
  if test "x${HSBUILD}" = xyes; then
	HSBUILD="${ALTERNATE_BUILD}"
  elif test "x${HSBUILD}" = xno; then
	HSBUILD="${ORIGINAL_BUILD}"
  fi
  AC_MSG_RESULT([${HSBUILD}])
  AC_SUBST([HSBUILD])
  AM_CONDITIONAL(WITH_ALT_HSBUILD, test "x${HSBUILD}" != "x${ORIGINAL_BUILD}")
])

AC_DEFUN([IT_WITH_HOTSPOT_SRC_ZIP],
[
  AC_MSG_CHECKING(for a HotSpot source zip)
  AC_ARG_WITH([hotspot-src-zip],
              [AS_HELP_STRING(--with-hotspot-src-zip,specify the location of the hotspot source zip)],
  [
    ALT_HOTSPOT_SRC_ZIP=${withval}
    AM_CONDITIONAL(USE_ALT_HOTSPOT_SRC_ZIP, test x = x)
  ],
  [ 
    ALT_HOTSPOT_SRC_ZIP="not specified"
    AM_CONDITIONAL(USE_ALT_HOTSPOT_SRC_ZIP, test x != x)
  ])
  AC_MSG_RESULT(${ALT_HOTSPOT_SRC_ZIP})
  AC_SUBST(ALT_HOTSPOT_SRC_ZIP)
])

AC_DEFUN([IT_WITH_JAXP_DROP_ZIP],
[
  AC_MSG_CHECKING(for a JAXP drop zip)
  AC_ARG_WITH([jaxp-drop-zip],
              [AS_HELP_STRING(--with-jaxp-drop-zip,specify the location of the JAXP drop zip)],
  [
    ALT_JAXP_DROP_ZIP=${withval}
    AM_CONDITIONAL(USE_ALT_JAXP_DROP_ZIP, test x = x)
  ],
  [ 
    ALT_JAXP_DROP_ZIP="not specified"
    AM_CONDITIONAL(USE_ALT_JAXP_DROP_ZIP, test x != x)
  ])
  AC_MSG_RESULT(${ALT_JAXP_DROP_ZIP})
  AC_SUBST(ALT_JAXP_DROP_ZIP)
])

AC_DEFUN([IT_WITH_JAF_DROP_ZIP],
[
  AC_MSG_CHECKING(for a JAF drop zip)
  AC_ARG_WITH([jaf-drop-zip],
              [AS_HELP_STRING(--with-jaf-drop-zip,specify the location of the JAF drop zip)],
  [
    ALT_JAF_DROP_ZIP=${withval}
    AM_CONDITIONAL(USE_ALT_JAF_DROP_ZIP, test x = x)
  ],
  [ 
    ALT_JAF_DROP_ZIP="not specified"
    AM_CONDITIONAL(USE_ALT_JAF_DROP_ZIP, test x != x)
  ])
  AC_MSG_RESULT(${ALT_JAF_DROP_ZIP})
  AC_SUBST(ALT_JAF_DROP_ZIP)
])

AC_DEFUN([IT_WITH_JAXWS_DROP_ZIP],
[
  AC_MSG_CHECKING(for a JAXWS drop zip)
  AC_ARG_WITH([jaxws-drop-zip],
              [AS_HELP_STRING(--with-jaxws-drop-zip,specify the location of the JAXWS drop zip)],
  [
    ALT_JAXWS_DROP_ZIP=${withval}
    AM_CONDITIONAL(USE_ALT_JAXWS_DROP_ZIP, test x = x)
  ],
  [ 
    ALT_JAXWS_DROP_ZIP="not specified"
    AM_CONDITIONAL(USE_ALT_JAXWS_DROP_ZIP, test x != x)
  ])
  AC_MSG_RESULT(${ALT_JAXWS_DROP_ZIP})
  AC_SUBST(ALT_JAXWS_DROP_ZIP)
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

AC_DEFUN([IT_CHECK_WITH_HG_REVISION],
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

AC_DEFUN([IT_CHECK_IF_BOOTSTRAPPING],
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

AC_DEFUN([IT_CHECK_FOR_JDK],
[
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
    if test "x${enable_bootstrap}" = "xyes"; then
      BOOTSTRAP_VMS="/usr/lib/jvm/java-gcj /usr/lib/jvm/gcj-jdk /usr/lib/jvm/cacao";
    fi
    for dir in ${BOOTSTRAP_VMS} /usr/lib/jvm/java-openjdk \
              /usr/lib/jvm/icedtea6 /usr/lib/jvm/java-6-openjdk \
              /usr/lib/jvm/openjdk /usr/lib/jvm/java-icedtea ; do
       if test -d $dir; then
         SYSTEM_JDK_DIR=$dir
	 break
       fi
    done
  fi
  AC_MSG_RESULT(${SYSTEM_JDK_DIR})
  if ! test -d "${SYSTEM_JDK_DIR}"; then
    AC_MSG_ERROR("A JDK home directory could not be found.")
  fi
  AC_SUBST(SYSTEM_JDK_DIR)
])

AC_DEFUN([IT_CHECK_WITH_TZDATA_DIR],
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

dnl Generic macro to check for a Java class
dnl Takes two arguments: the name of the macro
dnl and the name of the class.  The macro name
dnl is usually the name of the class with '.'
dnl replaced by '_' and all letters capitalised.
dnl e.g. IT_CHECK_FOR_CLASS([JAVA_UTIL_SCANNER],[java.util.Scanner])
AC_DEFUN([IT_CHECK_FOR_CLASS],[
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
    $2.class.toString();
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

AC_DEFUN([IT_GETDTDTYPE_CHECK],[
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
  if $JAVAC -cp . $JAVACFLAGS -source 5 $CLASS >&AS_MESSAGE_LOG_FD 2>&1; then
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

AC_DEFUN_ONCE([IT_CHECK_FOR_PAX],[
AC_CACHE_CHECK([if a PaX-enabled kernel is running], it_cv_pax, [
if grep '^PaX:' /proc/self/status >&AS_MESSAGE_LOG_FD 2>&1; then
  it_cv_pax=yes;
else
  it_cv_pax=no;
fi
])
AM_CONDITIONAL([HAS_PAX], test x"${it_cv_pax}" = "xyes")
AC_PROVIDE([$0])dnl
])

AC_DEFUN([IT_JAVAH],[
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
