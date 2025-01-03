<script>
  if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('flutter_service_worker.js')
      .then(function(registration) {
        console.log('Service Worker registrado com sucesso:', registration);
      })
      .catch(function(error) {
        console.log('Falha ao registrar o Service Worker:', error);
      });
  }
</script>
