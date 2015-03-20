EAPI=5

inherit eutils multilib toolchain-funcs versionator

DESCRIPTION="stub lock functions to run apps on filesystems without lock support"
HOMEPAGE="https://github.com/5kg/gentoo-overlay"

SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"

src_unpack() {
	mkdir ${S}
}

src_prepare() {
	cp ${FILESDIR}/* ${S}
}

src_compile() {
	emake
}

src_install() {
	dolib.so libnolock*$(get_libname)*
	sed -i "s:ROOT:${EPREFIX}/usr/lib:g" ${S}/nolock
	dobin nolock
}
