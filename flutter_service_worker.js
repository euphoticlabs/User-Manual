'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "7d85892d2e75775d1575981da2be86ea",
"assets/assets/images/cleaning-4m/monthly_4e1.png": "cdb5a46b3abce98712ae2889367d12d3",
"assets/assets/images/home/home2.png": "54a7f17881af5065ed21d60d04fdaab2",
"assets/assets/images/home/home1.png": "b0ce9f31aea58f4f570df8af4c8cda7b",
"assets/assets/images/stirrer/stirrer3.png": "e2af672f76026dbdb1d01bc9d80b5e41",
"assets/assets/images/stirrer/stirrer2.png": "d303ddb8757817c5e9131c00bf79ea46",
"assets/assets/images/stirrer/stirrer1.png": "09ae8da10c83583611c29a4ae25a22ef",
"assets/assets/images/launcher.png": "fd63ab999b77f7a8618a110bb2352661",
"assets/assets/images/chimney/chimney9.png": "50e47cb4b1717c477addda8a80038036",
"assets/assets/images/chimney/chimney8.png": "3d8a211419ced8f841a012da30df2352",
"assets/assets/images/chimney/chimney6.png": "2107c94c8d401ef5e9fcc9e777147570",
"assets/assets/images/chimney/chimney4.png": "07dc1bc2e7bfa3e017001c77cf442f4b",
"assets/assets/images/chimney/chimney5.png": "cd2124005f6815653d43cc200d446a96",
"assets/assets/images/chimney/chimney7.png": "988cf7d2bdba43f9c10c09531527afc6",
"assets/assets/images/chimney/chimney2.png": "1a387b6d91beaefcc70e8d0df440c31b",
"assets/assets/images/chimney/chimney3.png": "8d5f1794646c4bbd207d74c5935ea84d",
"assets/assets/images/chimney/chimney1.png": "683d12e0a051928745a2ceab258e086e",
"assets/assets/images/spice/spice4.png": "e24e1e99bb0d736e27c4ddd19ca616b7",
"assets/assets/images/spice/spice7.png": "afbceb3938e494619ece855f5c3a6d9b",
"assets/assets/images/spice/spice6.png": "bf618f381ccc9367c4bd2d4b3eb4173d",
"assets/assets/images/spice/spice2.png": "813bb3477854b11837445aeb34f67da5",
"assets/assets/images/spice/spice3.png": "9a6a46826e88b4b045d8723dc35b828d",
"assets/assets/images/spice/spice1.png": "34fabc37016bfc97158c056e2c63fb43",
"assets/assets/images/spice/spice5.png": "95f83c74f7394122e62819475745c8f0",
"assets/assets/images/cleaning-m/monthly6.png": "42f30544d9347fdec935bdf50f972cb7",
"assets/assets/images/cleaning-m/monthly3.png": "7c2a040b91465af6ae8eabbf28c7d95f",
"assets/assets/images/cleaning-m/monthly1.png": "0840675dc4f2bcace905199f05682d4c",
"assets/assets/images/cleaning-m/monthly5.png": "2884346a8acf07dc02e585f0a9ba8d4d",
"assets/assets/images/cleaning-m/monthly2.png": "163f2e524b904727d1bf61e8d9330a29",
"assets/assets/images/cleaning-m/monthly4.png": "cd57e678d002194c947df36e0f85cc41",
"assets/assets/images/drawer_icon.png": "bf5592a8cf8809aea4ff88c4e6d6c332",
"assets/assets/images/sensors/sensors1.png": "fde6c03bdb0d49d5704b2912373bdf44",
"assets/assets/images/sensors/sensors2.png": "480c169a08ca018100bf03c1ff93c936",
"assets/assets/images/sensors/sensors3.png": "fe74cb7a1a99b39f7f1b1e060d6bb496",
"assets/assets/images/cabinet_installation/cabinet_installation5.png": "75eb88ea955d2bbc13e90fdfc2a158e6",
"assets/assets/images/cabinet_installation/cabinet_installation1.png": "ff2fc12a828a588d3ab57f08c02b9357",
"assets/assets/images/cabinet_installation/cabinet_installation2.png": "39e667b2b0681c439231eb14ef50420c",
"assets/assets/images/cabinet_installation/cabinet_installation4.png": "8c596760aed155baeb683d21610b443c",
"assets/assets/images/cabinet_installation/cabinet_installation3.png": "f7a1e02912dbcc943c53450275bf7739",
"assets/assets/images/components/spice.png": "881a1dcf6a40cb46e778dc71df29a584",
"assets/assets/images/components/ingredients.png": "ecc1238b0471578ebe9ac14820922fda",
"assets/assets/images/components/liquid.png": "8241a2c167079380dcb78535f2d6f505",
"assets/assets/images/components/pan.png": "3578372fcc5c8ab00e36625dcbe53e61",
"assets/assets/images/components/sensors.png": "202a3c6909f09b742b71263511c2478f",
"assets/assets/images/components/stirrer.png": "79a5791aa6a2989449415087c2e676f8",
"assets/assets/images/components/induction.png": "08e39fc0e09bbb5137d797010edc22cd",
"assets/assets/images/components/chimney.png": "47b68869137851e4dd29bc3e7c32e739",
"assets/assets/images/liquid/liquid4.png": "bb1f73ce8a9b0cb300fdeb72321e6e4e",
"assets/assets/images/liquid/liquid3.png": "ff22d51303210d353629fca5fb3b93ce",
"assets/assets/images/liquid/liquid2.png": "08fe1141ee124c608b6cdffa11714fe9",
"assets/assets/images/liquid/liquid8.png": "812efb75842b7ff1a2333433cdef3d0a",
"assets/assets/images/liquid/liquid7.png": "bf7ff8630a745291ceac777d39bc5317",
"assets/assets/images/liquid/liquid5.png": "152b0fc8af41f57672a0299b2573d574",
"assets/assets/images/liquid/liquid1.png": "841481dce6d327ae66024a509ad9a3d7",
"assets/assets/images/liquid/liquid6.png": "8703fcb6ce16ef214302f33689170614",
"assets/assets/images/cleaning-d2d/daytoday6.png": "87989939ced0eba86de1eb2ab2555a83",
"assets/assets/images/cleaning-d2d/daytoday2.png": "cf97d6ab0b4d13c72a3a8049f12f0143",
"assets/assets/images/cleaning-d2d/daytoday7.png": "7edc1a5974003f76b872a2f0236ed449",
"assets/assets/images/cleaning-d2d/daytoday3.png": "3a8e14e2d3d74e7b9ffdb076db21ca37",
"assets/assets/images/cleaning-d2d/daytoday5.png": "8c48574a63b6cb3765aa05c42ce0ca5a",
"assets/assets/images/cleaning-d2d/daytoday4.png": "1ae5d0938569454dad16eaba047af909",
"assets/assets/images/cleaning-d2d/daytoday1.png": "8ea49731625488f8a7d552f50b7355c4",
"assets/assets/images/cleaning-d2d/daytoday8.png": "3cb41c4bcb3bab03e27517bc81790a9f",
"assets/assets/images/ingTray/tray7.png": "2f016b710f729ef209c6e8423d7cd622",
"assets/assets/images/ingTray/tray5.png": "dfafdee3df8dc21aefb64b1a7eb576b0",
"assets/assets/images/ingTray/tray6.png": "de77f561e5d1787133d023924e7f1563",
"assets/assets/images/ingTray/tray4.png": "6d0f136bfe4f34f055512f583e901a5c",
"assets/assets/images/ingTray/tray2.png": "fb60bebd2a7675937d76b6a9b7c50085",
"assets/assets/images/ingTray/tray3.png": "7a43218cd92237feef5577015879ca25",
"assets/assets/images/ingTray/tray1.png": "5f160f3db084746c542c0abaf094ca24",
"assets/assets/images/ingTray/tray8.png": "a765ca974418c619e7a2e57f89d30895",
"assets/assets/images/induction/induction1.png": "c45ba036c28e86c608daa8a0ea079b55",
"assets/assets/images/induction/induction2.png": "65b1532fc404036acc44aa199a878036",
"assets/assets/images/know-nosh/knownosh2.png": "7f283b03c1ae79e3278c08a71beb8a64",
"assets/assets/images/know-nosh/knownosh1.png": "99a92eb2c4e6bc51cbd5e61d81eb6d84",
"assets/assets/images/pan/pan1.png": "85806b2eee0719ac13f4e99211352fff",
"assets/assets/images/pan/pan2.png": "446e31843df9f3e089ffffe19733a160",
"assets/assets/images/pan/pan3.png": "78fb6c96946ce4bfc1a2db160dbbf5f1",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.json": "67cb5e4303054b458adc715c726f8240",
"assets/fonts/MaterialIcons-Regular.otf": "30c4a6805723f9b0a86f9058ae2d7c79",
"assets/AssetManifest.bin.json": "b06b0a9b53f906e89dba893ee4ca68cc",
"assets/NOTICES": "438e73a18d998e29510239ff8788463b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"version.json": "2903714ec6d1565c614e033561ad3445",
"manifest.json": "fc16fdaaf1339f2f6318bb6aab01183d",
"flutter_bootstrap.js": "0a3cfa8798ce5f4e7146ade9c6073026",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"index.html": "970553a701c676a9e6a6c666aa91067b",
"/": "970553a701c676a9e6a6c666aa91067b",
"favicon.png": "270fe0e5b3ac794489cc278570736071",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"icons/Icon-512.png": "20a8bb0393f7663fdc7732628eb1bc3c",
"icons/Icon-192.png": "a1be98d2a6caa62bae6fc887f3f48956",
"icons/Icon-maskable-512.png": "20a8bb0393f7663fdc7732628eb1bc3c",
"icons/Icon-maskable-192.png": "a1be98d2a6caa62bae6fc887f3f48956",
"main.dart.js": "e03cf61ce1e7c86bc5883e157635002e"};
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
