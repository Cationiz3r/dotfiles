import math, os
from deluge_client import DelugeRPCClient, FailedToReconnectException

def printExit(*args):
	print(*args)
	exit()

def readConfig(where):
	validKeys = ("host", "port", "user", "pass")
	conf = {}
	f = open(where)
	while(l := f.readline().rstrip()):
		key, val = l.split("=", 1)
		key, val = key.strip(), val.strip()
		if (not key in validKeys):
			raise Exception("Invalid config key: {}".format(key))
		if (key == "port"): conf[key] = int(val)
		else: conf[key] = val
	f.close()
	for key in validKeys:
		if (not key in conf): raise Exception("Missing key: {}".format(key))
	return [conf[key] for key in conf]

def getStatus(client):
	try: status = client.call('core.get_torrents_status', {}, ["total_uploaded"])
	except FailedToReconnectException: printExit("")
	except: printExit("Err")
	printExit(sum([status[i][b"total_uploaded"] for i in status]))

getStatus(DelugeRPCClient(*readConfig(os.getenv("POLYBAR_ROOT") + "/.priv/deluge.conf")))
