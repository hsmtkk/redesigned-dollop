package handle

import (
	"github.com/aws/aws-lambda-go/events"
	"go.uber.org/zap"
)

type Handler interface {
	Handle(evt events.SQSMessage) (string, error)
}

func New(sugar *zap.SugaredLogger) Handler {
	return &handlerImpl{sugar}
}

type handlerImpl struct {
	sugar *zap.SugaredLogger
}

func (h *handlerImpl) Handle(evt events.SQSMessage) (string, error) {
	h.sugar.Info("handle start")
	h.sugar.Info("handle finishi")
	return "", nil
}
