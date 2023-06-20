import 'package:get/get.dart';


class LocaleString extends Translations{
    @override
  Map<String, Map<String, String>> get keys => {
      'en_US' : {
        "personalInformation": "Personal Information",
        "name": "Name",
        "nameHint": "Enter your name",
        "email": "Email",
        "emailHint": "Enter your email",
        "dateOfBirth": "Date of Birth",
        "requiredField": "Required Field",
        "submitInfo": "Submit Info",
        "aboutUs": "About Us",
        "settings": "Settings",
        "changeLanguage": "Language",
        "about": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      },
      'ar_SA' : {
        "personalInformation": "معلومات شخصية",
        "nameHint": "أدخل أسمك",
        "email": "البريد الإلكتروني",
        "emailHint": "أدخل بريدك الالكتروني",
        "dateOfBirth": "تاريخ الولادة",
        "requiredField": "يتطلب حقلا",
        "submitInfo": "إرسال معلومات",
        "aboutUs": "معلومات عنا",
        "settings": "الإعدادات",
        "changeLanguage": "تغيير اللغة",
        "about": "لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق 'ليتراسيت' (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل 'ألدوس بايج مايكر' (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم."
      },
      'fr_CA' : {
        "personalInformation": "Renseignements personnels",
        "name": "Name",
        "nameHint": "Entrez votre nom",
        "email": "Courriel",
        "emailHint": "Enter your email",
        "dateOfBirth": "Date de naissance",
        "requiredField": "Champ obligatoire",
        "submitInfo": "Soumettre des informations",
        "aboutUs": "À propos de nous",
        "settings": "Paramètres",
        "changeLanguage": "Langue",
        "about": "Lorem Ipsum est simplement un texte factice de l’industrie de l’impression et de la composition. Lorem Ipsum est le texte factice standard de l’industrie depuis les années 1500, lorsqu’une imprimante inconnue a pris une galère de type et l’a brouillée pour faire un livre de spécimens de type. Il a survécu non seulement cinq siècles, mais aussi le saut dans la composition électronique, restant essentiellement inchangé. Il a été popularisé dans les années 1960 avec la sortie de feuilles de Letraset contenant des passages de Lorem Ipsum, et plus récemment avec des logiciels de publication assistée par ordinateur comme Aldus PageMaker, y compris des versions de Lorem Ipsum."
      }
    };
}