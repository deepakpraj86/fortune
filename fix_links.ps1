$files = Get-ChildItem -Filter *.html
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    # Logo link
    $content = $content -replace '<a href="#" class="block">\s*<img src="https://placehold.co/200x50/0a1d37/ffffff\?text=Fortune\+Mattress"', '<a href="index.html" class="block">`r`n    <img src="https://placehold.co/200x50/0a1d37/ffffff?text=Fortune+Mattress"'
    
    # Nav links
    $content = $content -replace 'href="#">Mattresses</a>', 'href="product.html">Mattresses</a>'
    $content = $content -replace 'href="#">Science of Sleep</a>', 'href="science.html">Science of Sleep</a>'
    $content = $content -replace 'href="#">Store Locator</a>', 'href="contact.html">Store Locator</a>'
    
    # Shopping Cart button to link
    $content = $content -replace '<button class="active:scale-95 transition-transform duration-200 relative">\s*<span class="material-symbols-outlined text-deep-navy">shopping_cart</span>', '<a href="ecommerce.html" class="active:scale-95 transition-transform duration-200 relative">`r`n<span class="material-symbols-outlined text-deep-navy">shopping_cart</span>'
    $content = $content -replace 'shopping_cart</span>\s*<span class="absolute([^>]+)>2</span>\s*</button>', 'shopping_cart</span>`r`n<span class="absolute$1>2</span>`r`n</a>'

    # Footer links
    $content = $content -replace 'href="#">Pocket Spring</a>', 'href="product.html">Pocket Spring</a>'
    $content = $content -replace 'href="#">Contact Us</a>', 'href="contact.html">Contact Us</a>'
    
    Set-Content $f.FullName -Value $content -NoNewline
}
