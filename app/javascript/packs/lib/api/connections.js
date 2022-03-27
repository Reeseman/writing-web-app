import Vue from 'vue';

Vue.mixin({
  methods: {
    makeNewConnection(fromUid, email, callback) {
      this.$http.get(`/make_connection?fromUid=${this.fromUid}&email=${this.form.email}`)
        .then(callback)
        .catch(this.handleStandardError);
    },
    acceptInboundConnectionRequest(uid1, uid2, callback) {
      this.$http.get(`/accept_connection?fromUid=${uid1}&toUid=${uid2}`)
        .then(callback)
        .catch(this.handleStandardError);
    },
    deleteAnyContactRequest(uid1, uid2, successMsg, callback) {
      this.$http.get(`/delete_connection?fromUid=${uid1}&toUid=${uid2}`)
        .then(response => {
          callback(successMsg)
        })
        .catch(this.handleStandardError);
    },
    getConnections(uid, callback) {
        this.$http.get(`/connections?uid=${uid}`, { })
          .then(callback)
          .catch(this.handleStandardError);
    },
    handleStandardError(error) {
      console.log(error);
    },
  }
});
