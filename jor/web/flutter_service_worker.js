self.addEventListener("install", (event) => {
  console.log("Service Worker: Installed");
  event.waitUntil(
    caches.open("flutter-app-cache").then((cache) => {
      return cache.addAll([
        "/",
        "/index.html",
        "/main.dart.js",
        "/icons/icon-192.png",
        "/icons/icon-512.png",
        "/manifest.json",
      ]);
    })
  );
});

self.addEventListener("fetch", (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request);
    })
  );
});
