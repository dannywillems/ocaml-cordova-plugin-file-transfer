(* -------------------------------------------------------------------------- *)
type t = private Ojs.t

val create : unit -> t
[@@js.new "FileTransfer"]

(* -------------------------------------------------------------------------- *)
(* Ocaml types and methods for upload method. Use them to have
 * type checking at compile time *)
(* HTTP_METHOD *)
type http_method  =
  | Post [@js "Post"]
  | Put [@js "Put"]
  [@@js.enum]

(* File Transfer Error code *)
type transfer_error_code =
  | File_not_found [@js 1]
  | Invalid_url [@js 2]
  | Connection [@js 3]
  | Abort [@js 4]
  | Not_modified [@js 5]
  [@@js.enum]

type transfer_error = private Ojs.t

(* One of the predefined error codes listed above. *)
val code          : transfer_error -> transfer_error_code
[@@js.get "code"]

(* URL to the source. *)
val source              : transfer_error -> string

(* URL to the target. *)
val target              : transfer_error -> string

(* HTTP status code. This attribute is only available when a response code
 * is received from the HTTP connection. *)
val http_status         : transfer_error -> int option

(* Response body. This attribute is only available when a response is
 * received from the HTTP connection. *)
val body                : transfer_error -> string option

(* Either e.getMessage or e.toString *)
val ext                 : transfer_error -> string
[@@js.get "exception"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type upload_options = private Ojs.t

val create_upload_options :
  ?file_key:string                                          ->
  ?file_name:string                                         ->
  ?http_method:http_method                                  ->
  ?mime_type:string                                         ->
  ?params:Ojs.t                                             ->
  ?chunked_mode:bool                                        ->
  ?headers:Ojs.t array                                      ->
  unit                                                      ->
  upload_options
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type upload_result = private Ojs.t

(* The number of bytes sent to the server as part of the upload. Not supported
 * on iOS *)
val bytes_sent          : upload_result -> int

(* The HTTP response code returned by the server. Not supported on iOS *)
val response_code       : upload_result -> int

(* The HTTP response returned by the server. *)
val response            : upload_result -> string

(* The HTTP response headers by the server. Only iOS is supported *)
val headers             : upload_result -> Ojs.t
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* Sends a file to a server *)
(* upload [url] [server_adress] [success_callback] [error_callback]
 * [options] [trust_all_hosts] *)
val upload :
  t                                           ->
  string                                      ->
  string                                      ->
  (upload_result -> unit)                     ->
  (transfer_error -> unit)                    ->
  ?options:upload_options                     ->
  ?true_all_hosts:bool                        ->
  unit                                        ->
  unit
[@@js.call]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type entry = private Ojs.t

val to_url : entry -> string
[@@js.get]

(* Other fields ? *)

(* Downloads a file from server *)
val download :
  t                                                                     ->
  string                                                                ->
  string                                                                ->
  (entry -> unit)                                                       ->
  (transfer_error -> unit)                                              ->
  ?true_all_hosts:bool                                                  ->
  (* Download options ? *)
  unit                                                                  ->
  unit
[@@js.call]

(* Aborts an in-progress transfer *)
val abort :
  t -> unit
[@@js.call]

(* -------------------------------------------------------------------------- *)
