# Ruby client for Blobstores
Copyright (c) 2009-2013 VMware, Inc.
Copyright (c) 2014 dujun@zju.edu.cn, Inc.

Lets BOSH access multiple blobstores using a unified API. Currently support `dav`, `simple`, `s3`, `swift`, `atmos`, `local` and `Blobstore` provider.

## Usage

    bin/blobstore_client_console [<options>]
        -p, --provider PROVIDER Bosh Blobstore provider
        -c, --config FILE       Bosh Blobstore configuration file

## Console

To explore the client API for accessing a blobstore, try creating and using a local blobstore:

```
$ gem install blobstore_client
$ blobstore_client_console -p local -c config/local.yml.example
=> Welcome to BOSH blobstore client console
You can use 'bsc' to access blobstore client methods
> bsc.create("this is a test blob")
=> "ef00746b-21ec-4473-a888-bf257cb7ea21" 
> bsc.get("ef00746b-21ec-4473-a888-bf257cb7ea21")
=> "this is a test blob"
> bsc.exists?("ef00746b-21ec-4473-a888-bf257cb7ea21")
=> true
> Dir['/tmp/local_blobstore/**']
=> ["/tmp/local_blobstore/ef00746b-21ec-4473-a888-bf257cb7ea21"]
> bsc.delete("ef00746b-21ec-4473-a888-bf257cb7ea21")
=> true
```

/bindemo

## Configuration

These options are passed to the Bosh Blobstore client when it is instantiated.

### Local

These are the options for the Blobstore client when provider is `local`:

* `blobstore_path` (required)
  Path for the blobstore

### Simple

These are the options for the Blobstore client when provider is `simple`:

* `endpoint` (required)
  Blobstore endpoint
* `user` (optional)
  Blobstore User
* `password` (optional)
  Blobstore Password
* `bucket` (optional, by default `resources`)
  Name of the bucket

### Amazon S3

These are the options for the Blobstore client when provider is `s3`:

* `bucket_name` (required)
  Name of the S3 bucket
* `encryption_key` (optional)
  Encryption_key that is applied before the object is sent to S3
* `access_key_id` (optional, if not present, the blobstore client operates in read only mode)
  S3 Access Key
* `secret_access_key` (optional, if not present, the blobstore client operates in read only mode)
  S3 Secret Access Key

### Atmos

These are the options for the Blobstore client when provider is `atmos`:

* `url` (required)
  Atmos URL
* `uid` (required)
  Atmos UID
* `secret` (required)
  Atmos password

### OpenStack Swift provider

These are the options for the Blobstore client when provider is `swift`:

* `container_name` (required)
  Name of the container
* `swift_provider` (required)
  OpenStack Swift provider (supported: `hp`, `openstack` and `rackspace`)

#### OpenStack Object Storage

These are the options for the Blobstore client when `swift_provider` is `openstack`:

* `openstack_auth_url` (required)
  URL of the OpenStack Identity endpoint to connect to
* `openstack_username` (required)
  OpenStack user name
* `openstack_api_key` (required)
  OpenStack API key
* `openstack_tenant` (required)
  OpenStack tenant name
* `openstack_region` (optional)
  OpenStack region
  
  
##
blobstore_client(blobstore)clientclient
* create_file
* get_file
* delete_object
* object_exists?
* object_file_path

blobstore`bosh/blobstore_client/lib/blobstore_client/client.rb`stringclassblobstore`bosh/blobstore_client/lib/blobstore_client/base.rb`class BaseClientClass Clientblobstore
* create

Saves a file or a string to the blobstore. If it is a String, it writes it to a temp file then calls create_file() with the (temp) file.

* get
Get an object from the blobstore.

*delete

*exist?

blobstoreBaseClient.

blobstoreconfig"-c"bosh

```
$ blobstore_client_console -p local -c config/local.yml.example
```

###local

local blobstore`/tmp/local_blobstore`object file(uuid)

###dav_blobstore
dav_blobstorehttpdav_blobstore_clienthttp client

```
@client = HTTPClient.new

def url(id)
  prefix = Digest::SHA1.hexdigest(id)[0, 2]

  [@endpoint, prefix, id].compact.join('/')
end

def create_file(id, file)
  id ||= generate_object_id

  response = @client.put(url(id), file, @headers)

  raise BlobstoreError, "Could not create object, #{response.status}/#{response.content}" if response.status != 201

  id
end
```

create_filehttp clientputHttp timeout

###simple_blobstore

dav_blobstoresimple_blobstorehttpcreate_filehttp`post`

```
response = @client.post(url(id), { content: file }, @headers)
```

###swift_blobstore

swift_blobstoreswift_blobstoreproviders`hp`, `openstack`, `rackspace`.

```
swift = Fog::Storage.new(swift_options)
```

swiftFogStorageCPI
