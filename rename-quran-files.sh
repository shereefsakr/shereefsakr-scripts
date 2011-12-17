<<DOC
rename-quran-files is a script to rename quran files to be readable and can be sorted alphabetically. (for usage on smart phones).
Copyright (C) 2011  Shereef Sakr

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
DOC

#!/bin/bash
## Soware Names
declare -a sowarNames=(
'الفاتحة'
'البقرة'
'آل عمران'
'النساء'
'المائدة'
'الأنعام'
'الأعراف'
'الأنفال'
'التوبة'
'يونس'
'هود'
'يوسف'
'الرعد'
'إبراهيم'
'الحجر'
'النحل'
'الإسراء'
'الكهف'
'مريم'
'طه'
'الأنبياء'
'الحج'
'المؤمنون'
'النّور'
'الفرقان'
'الشعراء'
'النّمل'
'القصص'
'العنكبوت'
'الرّوم'
'لقمان'
'السجدة'
'الأحزاب'
'سبأ'
'فاطر'
'يس'
'الصافات'
'ص'
'الزمر'
'غافر'
'فصّلت'
'الشورى'
'الزخرف'
'الدّخان'
'الجاثية'
'الأحقاف'
'محمد'
'الفتح'
'الحجرات'
'ق'
'الذاريات'
'الطور'
'النجم'
'القمر'
'الرحمن'
'الواقعة'
'الحديد'
'المجادلة'
'الحشر'
'الممتحنة'
'الصف'
'الجمعة'
'المنافقون'
'التغابن'
'الطلاق'
'التحريم'
'الملك'
'القلم'
'الحاقة'
'المعارج'
'نوح'
'الجن'
'المزّمّل'
'المدّثر'
'القيامة'
'الإنسان'
'المرسلات'
'النبأ'
'النازعات'
'عبس'
'التكوير'
'الإنفطار'
'المطفّفين'
'الإنشقاق'
'البروج'
'الطارق'
'الأعلى'
'الغاشية'
'الفجر'
'البلد'
'الشمس'
'الليل'
'الضحى'
'الشرح'
'التين'
'العلق'
'القدر'
'البينة'
'الزلزلة'
'العاديات'
'القارعة'
'التكاثر'
'العصر'
'الهمزة'
'الفيل'
'قريش'
'الماعون'
'الكوثر'
'الكافرون'
'النصر'
'المسد'
'الإخلاص'
'الفلق'
'النّاس'
)

for file in *.mp3 ; do
        # Get file index from file name
        index=${file%.mp3}
	index=$(expr $index + 1 - 1 )

        # Change file name
	newfilename="$index - ${sowarNames[$index-1]}".mp3
	echo $newfilename
        mv $file "$newfilename"
done
