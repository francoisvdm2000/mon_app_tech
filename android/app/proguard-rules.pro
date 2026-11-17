# ShowTech Tools — règles R8 complémentaires
# (Flutter, Firebase, Billing, Facebook SDK fournissent déjà leurs propres règles)

# Garder des stack traces lisibles dans la Play Console (avec mapping.txt)
-keepattributes SourceFile,LineNumberTable,*Annotation*,Signature,InnerClasses,EnclosingMethod
-renamesourcefileattribute SourceFile

# Flutter référence Play Core (deferred components) sans l'embarquer
-dontwarn com.google.android.play.core.**
