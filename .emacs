;; Remove bloat bars
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)


;; Enable Interactive Do
(require 'ido)
(ido-mode t)


;; LSP and Snippets
(yas-global-mode 1)
(global-company-mode 1)
(require 'eglot)


;; Enable MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)


;; Enable Multiple Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)



;; Enable UndoTree Undo Fu





;; Frame Design or sum
(defun my/c-style-setup ()
  (c-set-style "bsd")
  (setq c-basic-offset 4))

(add-hook 'c-mode-hook (lambda () (c-set-style "bsd")))
(add-hook 'c-mode-hook #'my/c-style-setup)

(setq-default c-default-style "bsd")
(add-to-list 'default-frame-alist' (font . "Cascadia Mono-17"))

(add-to-list 'eglot-ignored-server-capabilities :documentOnTypeFormattingProvider)

(add-to-list 'eglot-ignored-server-capabilities :documentFormattingProvider)
(add-to-list 'eglot-ignored-server-capabilities :documentRangeFormattingProvider)




;; Random Shit Emacs adds whenever i install sumthi
;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("3a8520a563ef5719ef22438ceb5f2ba6c43cf6f7103aaf3686a3c3183365ca6f"
     "961ab0e773a65a40e1d79cea9dd2d2a1b249040c1e8c0051e4fbd0b79bf33ca4"
     "e22b0d2723236d63e94675ab1376c7f2823fd7d61b8dbdb4e2f666295759e405"
     "0c2135b630ac7832400590361afd18a5fc826b64a284737d84c40d2340281e2a"
     "7597c5218bfd22e4543a04d6741e445c58b9b069554d1d7468ea8f3ef7a05e68"
     "c075dd16fcb89757ecdc7d4d2536044399bcd9f11ad491a8cb5bc83782592e31"
     "ebb3702af745d60af053d7e6f30b453d8b6c7e907ce0ad4565c0b51020d582a3"
     "fdaf036ac62069f9b785ad2486b8106fb704b7c898d73ff7f66dc657523349d3"
     "01f347a923dd21661412d4c5a7c7655bf17fb311b57ddbdbd6fce87bd7e58de6"
     "9af2b1c0728d278281d87dc91ead7f5d9f2287b1ed66ec8941e97ab7a6ab73c0"
     "83447ed09cba2ec725225cb3789b38ba94bd4ec4e0253e8d85f278076bc5b6cf"
     "ae700d22f976c303457c0de76fcad0e1004cc3e5b40b4137ee62294d2855f43d"
     "e58e7b6ad0670da5faa4ca8b6471ff2b4c561a4af09ebb8d1e0a107e9e451727"
     "d9af98af9613efe2ca6adf9d010c10abf0f3d4dd3987a87dae2a4750b4ab1ee9"
     "a7026ae6351ed42b2e71f373e173e6d9da5bd0c5461dc1861aa74c1a247c1a97"
     "9e0798a991e7913a47ba7a480953787f67a6d01c29bbcaeee213e20a38daf270"
     "4645d185b3699dae29c8613e1af3981cd20a26822bdd6d759fe305025fbede7f"
     "64940177202abecafcf78a47789165cce202e276b10c390e8aecaad41dfa6b4c"
     "da4227ca47b0f4f9bddffec324d6d40ecd97a5daaa6d1974020e7284a5f90c81"
     "d2d418b30adbb7b59f59b8d7fcd0251108b082bd5a33a3bc992f0c72f771483e"
     "ea6dd0727ab46c59525ef57786195a258846d9b956991a77df1b1c8ef2d4f83b"
     "b854595c9b0c05015614501479923fb30dbc4a3c9f701ab6d2fbd84746d85280"
     "a9c6977aa9fe3f369cae0a100537aae54d7071fb8882961dc75b88ed0aa08191"
     "a5c590aeb7dc5c2b8d36601a4c94a1145e46bd2291571af02807dd7a8552630c"
     "7524429b9671ca0ad0e281dc865717f44f358e417c7b587b57772430fcbe552f"
     "d551e42ad5374f288743806ef1936c46774263a1602017c32547346eb4af7e0b"
     "628c286aabd416aed0bf995748051c2701a20a0c2c7f13bb98cead99027418d4"
     "95b51aab1acd95ebcc7f47a60dd02d1a6b4b2c4aa68027b6d4138c2f70c583ae"
     "ec57e2d38e70bcb813fd2a5ee0b2b19826c69919c0b55a9b2bb50ce3bb92d8bd"
     "47e6f8c23eaea064b89ed1361b5824ee4f9562a8c4a30774ee9ee69f9b9d4f69"
     "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633"
     "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36"
     "67256d7183dc290d2e7b5ab13137774f8d4547a0040986a3a13edb6a208538fa"
     "36a9aa30ed9f3e23e956b03007852d43d6f38a25f22bf40e8cd3026097775a41"
     "615d8f3208b19161ada77e155beaca0678a35abb182ceae87e26660ecbca04d5"
     "9e9209fd17023af648e3aaf682255c29beddf5ceb04c3ce7cc883323c2b54901"
     "10e330880269244ae45ae9e02fe6f55766da9e15036e7c7f07d7ce228195deb5"
     "0ef0c3e24c8f704430e2b2f473101c08fb8bab93d09a80dbc2ea2dbb799aa861"
     "b0621a1632e5d8793e43fac621a115378aa3de6c7a7804ccb361eae63d2c6259"
     "b1739fbbd16aa4ce7cef132cf4d5308637970e69124f134b8ae1ffdba1282dd9"
     "e7b34efca11a7841d4ec0a07af3772d2c59795862dd3a2e5c4ef92580e1dfc61"
     "b8e08919a9bbb24d4296fcccb9433d5c6b3249997f29619b4abead03915128f4"
     "6a2eea93bcbd4dcd509dbcd5099b11fe8c1689b8c8d32150d1fb999e7f379186"
     "138ed99a323c1b93c52f4b3726caf2bc634b79a76fa63a3d3aff76394db5f28f"
     "8325ce8887001cf97589b3460ee88fd3344a290a815ec248945de6d223b7b01f"
     "6dcc66a60dce37a5817d46e7b1f838ac5d95a79061119adeb7c04c7ae9f511d0"
     "967c23e9ba179b80560774419f081df22e7674aac23c5c550b817e4a1ce7d058"
     "2493d0ad0bb94bd2ad297a6d76288751a532fd6d8d6af694ac14008caa6b7fa2"
     "28f3ac0f5fade64dc7e27abe9d32e7d85576c40940977e8e319f25055d3a28b7"
     "4140d924d739f3af159eb949b6e3ffa225e7f9a8bd615ca10c42f28e87e8eb42"
     "ddfa6609a268cb75b1264a008a00a3c2b9a0a0f6ba5ca3a723a5e3ab9badeeb0"
     "7ce3a35c349be254e82a3c4f0f555639e729ef07cdd1c5c9f0358163eff99fe6"
     "07a42a3d2a5fa5cfaad0178e35b1c4e15f7bbfb6416395893dd75cac9a351750"
     "78cd7e98597d9e2aeecc042cb68f8bce967084e7bd779f792c11d9144673203f"
     "9e9fbcfbd4097d606e523e987a3b06345ce219aff06006d8be98abc7fac6f86f"
     "6a99888fbccd88c022e839b6e4c120f0a93e3a49ebe7f3bf8914572767ffea7d"
     "8be6ef51193ef57a2d8931c319d0d79fceb34026ddd573bf91be05be724ce3dd"
     "525c01ec8eb353f5c0895c240d06889f8e3e06b7a5a4d3c8dfa8289a514d7801"
     "791d25bf455c8a727d412dcddb9d5380c7e9bc8941584f839d63e136108803a7"
     "5e116aef146f963acd29eb83b509cac000e6094e6b5f2e84dacb1a19ccb09447"
     "8f5b7d56999c86f00982cfbfd8e6cad9b4d6eb0f561c4f66e89d414ceb3bd29c"
     "b2b5e96a5cdda0a5dce3420e0eac37276231a6a5e79816d20040f38075d81fe3"
     "ba7682deadc8cefeeb07a1198ba4b777c9fd1cdab7c7798892a5aab598336baa"
     "606d9e3d98ef969d4e9eba9628ee1ce25934ecfe72cd0a995d31c907cb69dafd"
     "5de3e12da5f2cc8fbf99923964ad4367720e7fcb97e146e067f4db8799a86f5f"
     "69aafaf59656887750bfeeb890d81173d41cca498b362928f5d240be591a0add"
     "ded0cd1b37a2633465fd30dca9b7aa9b5e57dca6d3337bf80d54c9ebd241e755"
     "ca42424bb1ce63edd27fe89d0958bc78a9e8f6032db1c15b45fbb88cfe823ddd"
     "f5823ed842375c0874f876b352f624ef46f00f7ecdcb43d433f248307b3f6b86"
     "866c42bcd430df48c64e86694fa62737fc0eb2bfbbe6f68d7d95dd9f05d63bb3"
     "f7a004e3a1f920d79a02988fd20a9af9f5cedb1491918e1ef247bf7481cbe93b"
     "3afa642b2bfcd45a84b2725a87a88f0063b9787162b067bb8e614e7301be69e1"
     "b094d1a522d3ffa94b09811ae6af217bb01579a1f58d13b4f517306d94e6ea4e"
     "f2f07719428af0572740e5f962677173777b439349ec6abc0db2db8d4ce3de41"
     "daa27dcbe26a280a9425ee90dc7458d85bd540482b93e9fa94d4f43327128077"
     "c20728f5c0cb50972b50c929b004a7496d3f2e2ded387bf870f89da25793bb44"
     "d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6"
     "5474d779462cf40f889aa91e334f725b9308116d784967bd11ba9eec26bfaa12"
     "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1"
     "7fea145741b3ca719ae45e6533ad1f49b2a43bf199d9afaee5b6135fd9e6f9b8"
     "46433a4be67ff0f415175d0876ef9435d190f3aa57bb00670febd70ba0ba52e1"
     "1d89fcf0105dd8778e007239c481643cc5a695f2a029c9f30bd62c9d5df6418d"
     "6d373eab9e2d62c6905d33bc754c603e3977a18b3516b8ad13d57a4ca63a0aaa"
     "8bbe58320d4e14ee7946c139ed595a5fea0fe3d5ad65086f6050a6ba408371bd"
     "5815bbcf81345dd422438c6649c15acf562f1205d302bc09bbf5716ff7ac4e56"
     "8e9e7bbc712ee659c2a1c9d5f2ba42c38ca199ce3d0a982dcad315881a3fcd90"
     "7dc1dd6fae32c5840715cecebed8c5a58e43fc855d729d289a770f58f4cbf2c8"
     "a83704eeba8a51c1ac37077484944d5f605417598f3dc826728e0a190db18d64"
     "7b22ada21974b47dff9eaadacd8742540d1ac90dcf6c589493e55010cd9b0c76"
     "93658293fc82839722a71c2a18e324d4dad37fa64e2a39fad283e5593480b157"
     "d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87"
     "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378"
     "a0074afc88f875c2d6905ca5bd39df1ca226e201fc2fd7338bac21df7d957b05"
     "0491d19965bfea8b7d0a64dea6fd7343c45d42a417184fa6e15d851db5dad3f5"
     "74828a8db9af899ca4301f38dd5ef4ed20266613b29715299ac54e8fde98e2f3"
     "5b7c9906ed176f4a461af7655e1b67f6a5e3066fd1a3c3efa06bce2ebae6d7d3"
     "b0391e3cd4097e7a7a235bec7ce3a1c4e7c79339b92fe65cecca20fcf494bd0f"
     "6cce9735348e00ace46dc857f082dd41abccb9781d3a56ede2580eefa4e40eb4"
     "d3c0bb5bc4d1fbabd01f123774e4a6afe98502702ac7181ed6e7e33aa5098878"
     "8b4af9cacdaaf0a85e968abb2111f563cf82a16a005b7fac6f6026cc5d13bd10"
     "1771bae92fd9e220ef4eefd85227aecf53159eebd34a366eed119271b19fd959"
     "004f174754c688f358fa2afc4f8699b5db647fbfaa0d6b55ff39f63e05bfbbf5"
     "f1c8202c772d1de83eda4765fe21429a528a4fb350a28394d3705fe9678ed1f9"
     "19a2c0b92a6aa1580f1be2deb7b8a8e3a4857b6c6ccf522d00547878837267e7"
     "98903fd119e957d26bf7f620c1c27a411b5960edcc63d46c27fc92a3d8d39b36"
     "29eee495ddbdfd182be89e4416f9d7ec3420195731895dfb8771e4ed4b3cb481"
     "aeb5508a548f1716142142095013b6317de5869418c91b16d75ce4043c35eb2b"
     "52a99baa1ee94e34bbbfb4571224706bfb7dbdbc0494b421232d474c960b9d8e"
     "ca1b398ceb1b61709197478dc7f705b8337a0a9631e399948e643520c5557382"
     "f1b2de4bc88d1120782b0417fe97f97cc9ac7c5798282087d4d1d9290e3193bb"
     "54a07e4250791390837b3b30289c49b4972cdf350fb12e6430715fc97087caf4"
     "075ebf0443b362beac7da83995a6af1cf30c1591502d22b32903e7cb4a854831"
     "c34b1cd863f5249bfc3b86e0454368f9bb8d97ea0c5b760939933eee56ed4175"
     "9afcf2d0d88a677acd2c5db94e867fff840beef6bf2dbcdae25a61a1fb5ffd2b"
     "003d43dc884bca9783dc1fb0d5e1bbfbd294417787186c0211632100b365ddc2"
     "d8e5a864d1d6f9fabd459dfb529f3c2666a7e88b3f9258f37c91fe6154fa4453"
     "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe"
     "b0cedf3c6d8fbbf65934e2045dddacff0a031992f2f389215adcb0ca741347c3"
     "95cda51cb6a3fdf667a7710cf85cd67726440e556b91a316ebc5197f077903bb"
     "cbe7f2b12e2739b720225769cdc3a69dfb8a31544d5f86960a3fbdae4c58c0b8"
     "68a0201c7bb9dba9c9b6fd6662d1f3daf8865860ba8fc56d0201be859da535fc"
     "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20"
     "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d"
     "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "a68ec832444ed19b83703c829e60222c9cfad7186b7aea5fd794b79be54146e6"
     "b6760747b166ba414f6e41cf3c2e4c46fc681378540ef00273af8fbbed3fa0a0"
     default))
 '(display-line-numbers 'relative)
 '(package-selected-packages
   '(ancient-theme company darkman eglot eldoc eldoc-mouse
		   gruber-darker-ayu-theme gruber-darker-theme
		   koishi-theme multiple-cursors
		   phoenix-dark-pink-theme pink-bliss-uwu-theme
		   play-crystal sourcerer-theme spacemacs-theme
		   undo-tree yasnippet yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
