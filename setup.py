from distutils.core import setup, Extension
module1 = Extension('audiodev', sources = ['audiodev.cpp'],
                    include_dirs = ['rtaudio-4.0.8'],
                    libraries = ['pthread', 'asound'],
                    extra_link_args = ['rtaudio-4.0.8/librtaudio.a'])
module2 = Extension('audiospeex', sources = ['audiospeex.cpp'],
                    include_dirs = ['speex-1.2rc1/include'],
                    library_dirs = ['speex-1.2rc1/libspeex/.libs'],
                    libraries = ['speex', 'speexdsp'], extra_link_args = ['-fPIC'])
libdir = 'flite-1.4-release/build/x86_64-linux-gnu/lib'
module3 = Extension('audiotts', sources = ['audiotts.cpp'],
                    include_dirs = ['flite-1.4-release/include'],
                    library_dirs = [libdir],
                    libraries = ['flite_cmu_us_kal', 'flite_cmu_us_awb', 'flite_cmu_us_rms',
                          'flite_cmu_us_slt', 'flite_usenglish', 'flite_cmulex', 'flite'],
                    extra_link_args = ['-fPIC'])
setup (name = 'PackageName', version = '1.0',
       description = 'audio device and codecs module',
       ext_modules = [module1, module2, module3])