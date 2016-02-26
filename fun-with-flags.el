(defvar *image-path* "images")

(defvar *countries-by-continent*
  (list
   (cons "Africa"
         (list
          "Algeria" "Angola" "Benin" "Botswana" "Burkina"
          "Burundi" "Cameroon" "Cape Verde" "Central African Republic" "Chad"
          "Comoros" "Republic of the Congo" "Democratic Republic of the Congo" "Djibouti" "Egypt"
          "Equatorial Guinea" "Eritrea" "Ethiopia" "Gabon" "Gambia"
          "Ghana" "Guinea" "Guinea-Bissau" "Ivory Coast" "Kenya"
          "Lesotho" "Liberia" "Libya" "Madagascar" "Malawi"
          "Mali" "Mauritania" "Mauritius" "Morocco" "Mozambique"
          "Namibia" "Niger" "Nigeria" "Rwanda" "Sahrawi Arab Democratic Republic"
          "Sao Tome and Principe" "Senegal" "Seychelles" "Sierra Leone" "Somalia"
          "South Africa" "South Sudan" "Sudan" "Swaziland" "Tanzania"
          "Togo" "Tunisia" "Uganda" "Zambia" "Zimbabwe"))
   (cons "Asia"
         (list
          "Afghanistan" "Bahrain" "Bangladesh" "Bhutan" "Brunei"
          "Burma (Myanmar)" "Cambodia" "People's Republic of China" "Republic of China (Taiwan)" "East Timor"
          "India" "Indonesia" "Iran" "Iraq" "Israel"
          "Japan" "Jordan" "Kazakhstan" "Korea, North" "Korea, South"
          "Kuwait" "Kyrgyzstan" "Laos" "Lebanon" "Malaysia"
          "Maldives" "Mongolia" "Nepal" "Oman" "Pakistan"
          "Philippines" "Qatar" "Russian Federation" "Saudi Arabia" "Singapore"
          "Sri Lanka" "Syria" "Tajikistan" "Thailand" "Turkey"
          "Turkmenistan" "United Arab Emirates" "Uzbekistan" "Vietnam" "Yemen"))
   (cons "Europe"
         (list
          "Albania" "Andorra" "Armenia" "Austria" "Azerbaijan"
          "Belarus" "Belgium" "Bosnia and Herzegovina" "Bulgaria" "Croatia"
          "Cyprus" "Czech Republic" "Denmark" "Estonia" "Finland"
          "France" "Georgia" "Germany" "Greece" "Hungary"
          "Iceland" "Ireland" "Italy" "Latvia" "Liechtenstein"
          "Lithuania" "Luxembourg" "Macedonia" "Malta" "Moldova"
          "Monaco" "Montenegro" "Netherlands" "Norway" "Poland"
          "Portugal" "Romania" "San Marino" "Serbia" "Slovakia"
          "Slovenia" "Spain" "Sweden" "Switzerland" "Turkish Republic of Northern Cyprus"
          "Ukraine" "United Kingdom" "Vatican City"))
   (cons "North_America"
         (list
          "Antigua and Barbuda" "Bahamas" "Barbados" "Belize" "Canada"
          "Costa Rica" "Cuba" "Dominica" "Dominican Republic" "El Salvador"
          "Grenada" "Guatemala" "Haiti" "Honduras" "Jamaica"
          "Mexico" "Nicaragua" "Panama" "Saint Kitts and Nevis" "Saint Lucia"
          "Saint Vincent and the Grenadines" "Trinidad and Tobago" "United States"))
   (cons "Oceania"
         (list
          "Australia" "Cook Islands" "Fiji" "Kiribati" "Marshall Islands"
          "Federated States of Micronesia" "Nauru" "New Zealand" "Palau" "Papua New Guinea"
          "Samoa" "Solomon Islands" "Tonga" "Tuvalu" "Vanuatu"))
   (cons "South_America"
         (list
          "Argentina" "Bolivia" "Brazil" "Chile" "Colombia"
          "Ecuador" "Guyana" "Paraguay" "Peru" "Suriname"
          "Uruguay" "Venezuela"))
   ))
   
;; (loop
;;  with count = 0
;;  for (continent . countries) in *countries-by-continent*
;;  do (incf count (length countries))
;;  finally (return count))

;;;;;;;;;;;;;;;;;;;;;;
;; Helper functions ;;
;;;;;;;;;;;;;;;;;;;;;;
(defun fwf:country-to-filename (country)
  (format "%s.png" (mapconcat #'downcase (split-string country) "_")))

(defun fwf:get-flag-image (country)
  (let* ((filename (fwf:country-to-filename country))
	 (image-path (expand-file-name filename *image-path*)))
    (message "File: %s" image-path)
    (create-image image-path)))

(defun fwf:create-buffer-with-image (country)
  ""
  (interactive "sCountry: ")
  (with-current-buffer (generate-new-buffer country)
    (let ((image (fwf:get-flag-image country)))
      (iimage-mode)
      (iimage-mode-buffer t)
      (insert-image image)
      (local-set-key (kbd "q") 'kill-this-buffer)
      (switch-to-buffer (current-buffer)))))
