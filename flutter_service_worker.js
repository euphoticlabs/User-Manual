'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"manifest.json": "fc16fdaaf1339f2f6318bb6aab01183d",
"main.dart.js": "b1dcb65cef5fd77cc1f34fd9c769b200",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"index.html": "970553a701c676a9e6a6c666aa91067b",
"/": "970553a701c676a9e6a6c666aa91067b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/AssetManifest.bin.json": "933f6d48b214a1924f8424f15166de7b",
"assets/AssetManifest.bin": "22ba566aaaa6f7b07229ff1325e387bd",
"assets/NOTICES": "438e73a18d998e29510239ff8788463b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/images/components/chimney.png": "47b68869137851e4dd29bc3e7c32e739",
"assets/assets/images/components/sensors.png": "202a3c6909f09b742b71263511c2478f",
"assets/assets/images/components/ingredients.png": "ecc1238b0471578ebe9ac14820922fda",
"assets/assets/images/components/spice.png": "881a1dcf6a40cb46e778dc71df29a584",
"assets/assets/images/components/pan.png": "3578372fcc5c8ab00e36625dcbe53e61",
"assets/assets/images/components/induction.png": "08e39fc0e09bbb5137d797010edc22cd",
"assets/assets/images/components/stirrer.png": "79a5791aa6a2989449415087c2e676f8",
"assets/assets/images/components/liquid.png": "8241a2c167079380dcb78535f2d6f505",
"assets/assets/images/sensors/sensors2.png": "c8f97fcda36dd60bb7a05c2d869de78c",
"assets/assets/images/sensors/sensors3.png": "93d92940d3c7f94647aa7c8cf1d7a3d1",
"assets/assets/images/sensors/sensors1.png": "88bc8f2f6f6eccb72990eb1f1b374eb9",
"assets/assets/images/know-nosh/knownosh2.png": "f36bdf8cb10a38d272fc16322ef06a07",
"assets/assets/images/know-nosh/knownosh1.png": "fd6827d14eff8668a1e26936fc390964",
"assets/assets/images/chimney/chimney1.png": "f23fa99c33557eb9f434d9395e0ada43",
"assets/assets/images/chimney/chimney6.png": "67f847be760156172d2a74dd83e8734f",
"assets/assets/images/chimney/chimney7.png": "44f58a903172da08191dcd2f536e2484",
"assets/assets/images/chimney/chimney4.png": "07dc1bc2e7bfa3e017001c77cf442f4b",
"assets/assets/images/chimney/chimney9.png": "50e47cb4b1717c477addda8a80038036",
"assets/assets/images/chimney/chimney8.png": "796bd6dcf70077921c6680bf5dd37cb9",
"assets/assets/images/chimney/chimney5.png": "621fcff3cda4da68fa2bdbe406c2baa6",
"assets/assets/images/chimney/chimney3.png": "8d5f1794646c4bbd207d74c5935ea84d",
"assets/assets/images/chimney/chimney2.png": "1a387b6d91beaefcc70e8d0df440c31b",
"assets/assets/images/drawer_icon.png": "bf5592a8cf8809aea4ff88c4e6d6c332",
"assets/assets/images/launcher.png": "fd63ab999b77f7a8618a110bb2352661",
"assets/assets/images/induction/induction2.png": "b6b8000645f2e09b7f544cda5a56b75c",
"assets/assets/images/induction/induction1.png": "e657b1552a81847096e0d75a5dc3e45c",
"assets/assets/images/cleaning-d2d/daytoday3.png": "3a8e14e2d3d74e7b9ffdb076db21ca37",
"assets/assets/images/cleaning-d2d/daytoday4.png": "00c177f887f3937257d845364a85e73c",
"assets/assets/images/cleaning-d2d/daytoday2.png": "cf97d6ab0b4d13c72a3a8049f12f0143",
"assets/assets/images/cleaning-d2d/daytoday5.png": "3cb41c4bcb3bab03e27517bc81790a9f",
"assets/assets/images/cleaning-d2d/daytoday1.png": "8ea49731625488f8a7d552f50b7355c4",
"assets/assets/images/spice/spice5.png": "95f83c74f7394122e62819475745c8f0",
"assets/assets/images/spice/spice2.png": "39a85acf1df898b3448d005dadf1e015",
"assets/assets/images/spice/spice3.png": "6b5b8898e19496f489ec30ec4ae86b29",
"assets/assets/images/spice/spice6.png": "bf618f381ccc9367c4bd2d4b3eb4173d",
"assets/assets/images/spice/spice4.png": "e24e1e99bb0d736e27c4ddd19ca616b7",
"assets/assets/images/spice/spice7.png": "afbceb3938e494619ece855f5c3a6d9b",
"assets/assets/images/spice/spice1.png": "502103fe9582dddc3408f1e7b752e79a",
"assets/assets/images/cleaning-m/monthly1.png": "0840675dc4f2bcace905199f05682d4c",
"assets/assets/images/cleaning-m/monthly3.png": "7c2a040b91465af6ae8eabbf28c7d95f",
"assets/assets/images/cleaning-m/monthly4.png": "300c4e45a82861222213ecd3a02515db",
"assets/assets/images/cleaning-m/monthly2.png": "163f2e524b904727d1bf61e8d9330a29",
"assets/assets/images/cleaning-4m/monthly_4e1.png": "cdb5a46b3abce98712ae2889367d12d3",
"assets/assets/images/liquid/liquid3.png": "461d5c47ecf6aaed0e8244300df71212",
"assets/assets/images/liquid/liquid4.png": "bb1f73ce8a9b0cb300fdeb72321e6e4e",
"assets/assets/images/liquid/liquid7.png": "bf7ff8630a745291ceac777d39bc5317",
"assets/assets/images/liquid/liquid6.png": "8703fcb6ce16ef214302f33689170614",
"assets/assets/images/liquid/liquid2.png": "08fe1141ee124c608b6cdffa11714fe9",
"assets/assets/images/liquid/liquid5.png": "152b0fc8af41f57672a0299b2573d574",
"assets/assets/images/liquid/liquid8.png": "812efb75842b7ff1a2333433cdef3d0a",
"assets/assets/images/liquid/liquid1.png": "b1b10984c6c8b098df36b7c020adafd5",
"assets/assets/images/home/home2.png": "54a7f17881af5065ed21d60d04fdaab2",
"assets/assets/images/home/home1.png": "b0ce9f31aea58f4f570df8af4c8cda7b",
"assets/assets/images/pan/pan1.png": "eeddf6da125df1e301ba4f132c179265",
"assets/assets/images/pan/pan2.png": "446e31843df9f3e089ffffe19733a160",
"assets/assets/images/pan/pan3.png": "78fb6c96946ce4bfc1a2db160dbbf5f1",
"assets/assets/images/cabinet_installation/cabinet_installation1.png": "427a093b6953d210ad613a6a0ad3442e",
"assets/assets/images/cabinet_installation/cabinet_installation4.png": "00dff11e5a109a1f68e9b155458ea70a",
"assets/assets/images/cabinet_installation/cabinet_installation3.png": "9cc38f053eb11a3d37f0412cdd7bef1c",
"assets/assets/images/cabinet_installation/cabinet_installation2.png": "f7a1e02912dbcc943c53450275bf7739",
"assets/assets/images/ingTray/tray3.png": "7a43218cd92237feef5577015879ca25",
"assets/assets/images/ingTray/tray5.png": "dfafdee3df8dc21aefb64b1a7eb576b0",
"assets/assets/images/ingTray/tray4.png": "6d0f136bfe4f34f055512f583e901a5c",
"assets/assets/images/ingTray/tray2.png": "fb60bebd2a7675937d76b6a9b7c50085",
"assets/assets/images/ingTray/tray7.png": "3940bfff45c27e96da2078b327933e66",
"assets/assets/images/ingTray/tray1.png": "c29d51fa8ad320266b8e1cdb0d6921f0",
"assets/assets/images/ingTray/tray8.png": "d9554ef2f7a63442675a75bf186a2d42",
"assets/assets/images/ingTray/tray6.png": "de77f561e5d1787133d023924e7f1563",
"assets/assets/images/stirrer/stirrer1.png": "9089bd59bdff997ad34dce412d1b1b7e",
"assets/assets/images/stirrer/stirrer2.png": "d303ddb8757817c5e9131c00bf79ea46",
"assets/assets/images/stirrer/stirrer3.png": "e2af672f76026dbdb1d01bc9d80b5e41",
"assets/AssetManifest.json": "806a35220a2010578b31a99c70ea802e",
"assets/fonts/MaterialIcons-Regular.otf": "34d6ee48310eb2e610e93af1b383afcb",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"favicon.png": "270fe0e5b3ac794489cc278570736071",
"icons/Icon-512.png": "20a8bb0393f7663fdc7732628eb1bc3c",
"icons/Icon-maskable-192.png": "a1be98d2a6caa62bae6fc887f3f48956",
"icons/Icon-192.png": "a1be98d2a6caa62bae6fc887f3f48956",
"icons/Icon-maskable-512.png": "20a8bb0393f7663fdc7732628eb1bc3c",
"flutter_bootstrap.js": "209f208f3f6897cda0f87886aa67262c",
"version.json": "2903714ec6d1565c614e033561ad3445"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
