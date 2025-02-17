generate_info_plist:
	./generate_info_plist.sh

build_ios: generate_info_plist
	flutter build ios