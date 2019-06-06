# rpmbuild -bb rpmbuild/SPECS/amol.spec
#
Name:          Amol-Installer
Version:        1.0
Release:        1%{?dist}
Summary:         Auto Installer

Group :         Utilities
License:        DjAmol Group Inc
Source0:        Amol-Installer-1.0.tar.gz
BuildArch :     noarch


%description
Auto Installer Apache PHP, MariaDB,Curl,FFmpeg And More..
By DjAmol Group For Centos

%prep
%setup -q




%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/opt/amol
install autoinstall $RPM_BUILD_ROOT/opt/amol/autoinstall
install auto $RPM_BUILD_ROOT/opt/amol/auto
install latest.sh $RPM_BUILD_ROOT/opt/amol/latest.sh
install -d $RPM_BUILD_ROOT/opt/amol/src
cp -rf src/* $RPM_BUILD_ROOT/opt/amol/src/

install -d $RPM_BUILD_ROOT/opt/amol/inc
#cp -rf inc/* $RPM_BUILD_ROOT/opt/amol/inc/
install inc/*.sh $RPM_BUILD_ROOT/opt/amol/inc/


install -d $RPM_BUILD_ROOT/opt/amol/inc/ffmpeg
install inc/ffmpeg/*.sh $RPM_BUILD_ROOT/opt/amol/inc/ffmpeg/
cp -rf inc/ffmpeg/*.conf $RPM_BUILD_ROOT/opt/amol/inc/ffmpeg/




install -d $RPM_BUILD_ROOT/opt/amol/conf
cp -rf conf/* $RPM_BUILD_ROOT/opt/amol/conf/



install -d $RPM_BUILD_ROOT/opt/amol/pprogram
cp -rf pprogram/* $RPM_BUILD_ROOT/opt/amol/pprogram



%post
mkdir /$RPM_BUILD_ROOT/opt/two
$RPM_BUILD_ROOT/opt/amol/latest.sh
#chmod 755 -R $RPM_BUILD_ROOT/opt/amol/inc/
#chmod 755 $RPM_BUILD_ROOT/opt/amol/auto
#chmod 755 $RPM_BUILD_ROOT/opt/amol/inc/latest


%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
/opt/amol/autoinstall
/opt/amol/auto
/opt/amol/latest.sh
#%defattr(755,root,root,777)
#%dir /opt/amol/inc
%defattr(-,root,root,-)
/opt/amol/inc/*
%defattr(-,root,root,-)
%config(noreplace) /opt/amol/conf/*
/opt/amol/src/*
/opt/amol/pprogram/*
%doc



%changelog
*Tue Jun 10 2019 No Any Updates <djamolgroup@gmail.com> 1.0
-First Verion
-Release
