'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "a056e4a7b9f1d8d20de368ac25b42b08",
"version.json": "7f85db98ffd10c607d03e47b457d52ca",
"index.html": "4052055cf4497009b761293cae86e0b6",
"/": "4052055cf4497009b761293cae86e0b6",
"main.dart.js": "e3e3e7fa89cd701103971c4679d6a6a0",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "739c4b4c50b8abc97daa5eab89ddc479",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "fcaf09b17875d05bfb4ce18215943041",
".git/config": "1594aa3ff2f3b8d2ab5d16628fe8f275",
".git/objects/50/51cec8249962de69bc447acf816eee0168d8b0": "33ba176eef0ae56a9590eb1f3e54c3b9",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/57/6d6f5c8a72f1c9abe530b494d6e8dc484c58e5": "86d7e8284e4527b284ac226c5e5b1980",
".git/objects/3b/5f18beb4e03faafd4439b692b3ee65c3542d91": "169c798700bea602fb7297fbafd55566",
".git/objects/9e/b82846b94f68f43993252b810cc07e4b842ad2": "7455deaa7d359ddf27ee74279c0e088a",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/51/ecc971763caf452030e07b681e8d0050b6c864": "f6bce0c3f38f354bba3ccd7256062061",
".git/objects/51/34f66ab26b2c8ce35a521fd861ea2d1b3417fb": "61a91050ec6e3a369cdbe91a0d79ee92",
".git/objects/5f/c2e5648c1718924eafd514eead9e03b7e24455": "a9f4b6d3d14ea3c31b3b9faca15fdded",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/9d/e6ccc898e014a2d78f0a46027ecaf2b58b26f5": "64cd9a702d365d72ae4f6e46dc598746",
".git/objects/02/0491bd0c2bf74c2fb8e5ee99642db6cdfd8916": "084ed17ecae49146b8561d52089897f9",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/b3/0fc6933fb7b2232abd868c2b876052fa0fc698": "e2f265d1c261488e0268aa04548b91e5",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/d1/85fe7649365f782c6e9f8e627ec527e225cd8e": "5e8dcbe138cbff90c50b9632257b608c",
".git/objects/ae/8b9b8b03fd3ff1e715a981f96052c687aa2797": "5a88010ea5705f08d87cbf98e4f1af7c",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/c9/219a3b0e278f6ab510d5aa917dcbea9164f17f": "4d28d5409d069cd069579be11f738c17",
".git/objects/f5/373313f75b343b6b91099fa26e1b475dc7efad": "e4b8a131ef8801f89c5abebf3c71ade2",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/ca/ee4dae73bc43a21197ada01e0e690dac36f939": "2cc7fea6a94bcc0005a8f7455a8b62f9",
".git/objects/fb/22d2c5d915c4f0e19de628d79f63c323aa7748": "7cf62224d190254ad10697d0dbbe305c",
".git/objects/c1/04fd7af9a54cd39a5b900970a3247428b5de9e": "72d2d9c31d5f5e795883bce64ff14b25",
".git/objects/4b/3b15192573381c72b13751b962d0e421a370ef": "dcfa0c6b0d55889530d57712b0c97d0d",
".git/objects/pack/pack-5520facf46abf8dafa6d81bba992afa5bbe685f9.idx": "6dd6687647ee8da6c704edadecba6658",
".git/objects/pack/pack-5520facf46abf8dafa6d81bba992afa5bbe685f9.pack": "6ec86383ead4beb4483b2cf5a2ae7e50",
".git/objects/42/4d2bcc42d059e206499299575828004478cc87": "fd308f397bb45eaac9fb1e52452e01ed",
".git/objects/45/8133b968deea4238dd38fc3b67d28a1c9078ec": "8728dbb5e9122f5a9c28afc63d8ccccc",
".git/objects/74/328a128d4b7138ebad849feb462a04f0cb2e87": "5e64861e4badf2e42a44c84a8fdd2f24",
".git/objects/8f/c8be62f202c40e7d3e2e16242fb065cfc4e1a7": "6fda1b80da67a8d96186cf8ab8b24087",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/2a/9fdec7a366c62e88cd954bf971875c5505acd6": "76c5ff35a58f2a3649156b6be1950f9b",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/00/4e4c2644c677f613781ac12c551f41f6061f4b": "e5eac1a0592f758582cb17b0a1bb6f0d",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/98/001f8429113eeb6b474640d286fcdac3e6d09a": "b0cef4b6ce642b182032b96bf952b19e",
".git/objects/30/59078a7c919c79e64e5f5eabd6307c9d55b52d": "5cda4188957951007479c5f197863760",
".git/objects/08/a0e101eb3e55715ec503d983e654bb9b28eded": "8f64fc16531bd2198a3e3b09e86df4b9",
".git/objects/63/fcf38d29d7dfe5e3ec2af308051952639180f5": "a4dd813bd16a27011a71bff369ad6f3c",
".git/objects/b7/da216c89009ceb5fa7f1b4ccb9e5ea584fa5b6": "87b0c4cbc0d8b799df3a50cce3dd305e",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/b0/4533027e4634000e53caffdb124706b0d5a866": "242dccd9d23eaeacb56010f4653a045f",
".git/objects/b9/aa57ec3283cd0a0066900901057c8047060804": "3000b6e3f90d36c3808d3fbb82430b33",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/cc/0f8c5901446ec1d79f56a66a3ac02ceddc74a9": "12b3e4bee62d015f5822148673706495",
".git/objects/c2/44480955d03bb9130c74b3347be17684e4bf33": "3e85e37565d2b7b8cd08309f1c2ca0c5",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/cb/518f5daa27eea829d28971f648e0032d7070c2": "7157b84e6d9e7b8e387ca45d463b3924",
".git/objects/46/13f7269eeecf5b7f128a54bc7a12282c8f2aa2": "4b61951b26d4ef2006b65aaf1f3ae9bd",
".git/objects/1b/736686fa869b93876ab213421dd667505a1441": "71a84ebf98827aad3598db6760a0280c",
".git/objects/12/39316635e91a0ea8a21ab513ec8d2c28c4bebd": "2c00e950650d04ab3d5ea5278756d433",
".git/objects/8c/3fe624cdf86e6804907f3ea2716ee8be78d1bf": "a5c85b651ee0dd7dab7ef527270ac441",
".git/objects/1d/468b85698a60041b450286f31b3264b3bbd6f7": "5c8c497111befde32ac151f14cf92f85",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/8e/bfe87a0493622787e5e2705c5caa59e5ec529f": "3b400b7192312f28da0cf63a2d42a9c4",
".git/HEAD": "08aa6dd758fb6c785bfae5216c68d6b1",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "34945dd7abfc89c758e93c95900561d3",
".git/logs/refs/heads/release_web": "9b950c218c111cd68d385b1bd6272981",
".git/logs/refs/heads/main": "0fecc36599cd022f89899bf1fe23dd4c",
".git/logs/refs/remotes/origin/release_web": "1ada558d8748e759e1d89dd8d7628c05",
".git/logs/refs/remotes/origin/HEAD": "0fecc36599cd022f89899bf1fe23dd4c",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/release_web": "49151d08ce8be381e357e5ccb2d85c31",
".git/refs/heads/main": "d235bcb66e873ef2b998f22f15ebd1b8",
".git/refs/remotes/origin/release_web": "49151d08ce8be381e357e5ccb2d85c31",
".git/refs/remotes/origin/HEAD": "98b16e0b650190870f1b40bc8f4aec4e",
".git/index": "211b15c4030f9b9acabb686ff0c035fe",
".git/packed-refs": "542b37473ff774dce424260972bf6dab",
".git/COMMIT_EDITMSG": "477a90a0954dec22af946d57a438e22d",
"assets/AssetManifest.json": "bfd6cb651b666cff9d08ab02e16f20c4",
"assets/NOTICES": "21e04dceaecc616de9f3486ee25a144a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "9817661a6c2e107d71093f806e9d2454",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "8803c2a7cacc0b730c0a07988a7b26c6",
"assets/fonts/MaterialIcons-Regular.otf": "cc0eb9c0737c4bdf050be8d42aeac456",
"assets/assets/images/photos/photo.jpeg": "f2b72f340555cfb23624d210da6376a8",
"assets/assets/fonts/Gabriela/Gabriela-Regular.ttf": "884e529302c336655692df2a76be2472",
"assets/assets/fonts/Gabriela/OFL.txt": "210b5c572bb1d199f039d99a1efd6a3c",
"assets/assets/fonts/Kablammo/Kablammo-Regular.ttf": "5889406107fe037e7fbee8fae7f1a13a",
"assets/assets/fonts/Kablammo/OFL.txt": "bfd673822741c05ffbbf539f00aa0385",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
